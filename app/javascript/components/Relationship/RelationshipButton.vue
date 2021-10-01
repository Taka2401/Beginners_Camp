<template>
  <div>
    <div v-if="isRelationshiped" @click="deleteRelationship()" class="my-page-btn btn btn-primary">
      フォロー解除
    </div>
    <div v-else @click="registerRelationship()" class="my-page-btn btn btn-success">
      フォローする
    </div>
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
    }
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
      if (res.status !== 201) { process.exit() }
      this.fetchRelationshipByFollowedId().then(result => {
        this.relationshipList = result
      })
    },
    deleteRelationship: async function() {
      const relationshipId = this.findRelationshipId()
      const res = await axios.delete(`/api/v1/relationships/${relationshipId}`)
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