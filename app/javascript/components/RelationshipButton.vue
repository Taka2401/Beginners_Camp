<template>
  <div>
    <p>{{ followingCount }} フォロー</p>
    <p>{{ this.followersCount  }} フォロワー</p>
    <div v-if="isRelationshiped" @click="deleteRelationship()" class="btn btn-bg follow-followed">
      <i class="fas fa-user-minus"></i> フォロー解除
    </div>
    <div v-else @click="registerRelationship()" class="btn btn-bg" style="margin:0;">
      <i class="fas fa-user-plus"></i> フォローする
    </div>

    <pre>{{ $data }}</pre>
  </div>
</template>

<script>
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()

export default {
  props: ['followerId', 'followedId'],
  data() {
    return {
      relationshipList: [],
      followingCount: 0,
      followersCount: 0
    }
  },
   mounted() {
    this.followersCount = JSON.parse(localStorage.getItem('Followers'));
  },
  computed: {
    count() {
      return this.relationshipList.length
    },
    isRelationshiped() {
      if (this.relationshipList.length === 0) { return false }
      return Boolean(this.findRelationshipId())
    }
  },
  created: function() {
    this.fetchRelationshipByFollowedId().then(result => {
      this.relationshipList = result
    })
  },
  methods: {
    fetchRelationshipByFollowedId: async function() {
      const res = await axios.get(`/api/v1/relationships/?followed_id=${this.followedId}`)
      if (res.status !== 200) { process.exit() }
      return res.data
    },
    registerRelationship: async function() {
      const res = await axios.post('/api/v1/relationships', { followed_id: this.followedId })
      const countUp = this.followersCount += 1;
      // localStorageに値を追加
      localStorage.setItem('Followers', countUp);
      // 値を取得
      const incrementFollowers = localStorage.getItem('Followers');
      console.log(incrementFollowers);
      if (res.status !== 201) { process.exit() }
      this.fetchRelationshipByFollowedId().then(result => {
        this.relationshipList = result
      })
    },
    deleteRelationship: async function() {
      const relationshipId = this.findRelationshipId()
      const res = await axios.delete(`/api/v1/relationships/${relationshipId}`)
      const countDown = this.followersCount -= 1;
      // localStorageの値を減少
      localStorage.setItem('Followers', countDown);
      // 値を取得
      const decrementFollowers = localStorage.getItem('Followers');
      console.log(decrementFollowers);

      if (res.status !== 200) { process.exit() }
      this.relationshipList = this.relationshipList.filter(n => n.id !== relationshipId)
    },
    findRelationshipId: function() {
      const relationship = this.relationshipList.find((relationship) => {
        return (relationship.follower_id === this.followerId)
      })
      if (relationship) { return relationship.id }
    }
  }
}
</script>