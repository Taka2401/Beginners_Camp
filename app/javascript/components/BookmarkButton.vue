<template>
  <div>
    <div v-if="isBookmarked" @click="deleteBookmark()" class="btn btn-primary">
      ブックマーク中
    </div>
    <div v-else @click="registerBookmark()" class="btn btn-success">
      ブックマークする
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()

export default {
  props: ['userId', 'campPlaceId'],
  data() {
    return {
      bookmarkList: []
    }
  },
  computed: {
    count() {
      return this.bookmarkList.length;
    },
    isBookmarked() {
      if (this.bookmarkList.length === 0) { return false }
      return Boolean(this.findBookmarkId())
    }
  },
  created: function() {
    this.fetchBookmarkByCampPlaceId().then(result => {
      this.bookmarkList = result
    })
  },
  methods: {
    fetchBookmarkByCampPlaceId: async function() {
      const res = await axios.get(`/api/v1/bookmarks/?camp_place_id=${this.campPlaceId}`)
      if (res.status !== 200) { process.exit() }
      return res.data
    },
    registerBookmark: async function() {
      const res = await axios.post('/api/v1/bookmarks/', {
        camp_place_id: this.campPlaceId
      })
      if (res.status !== 201) { return process.exit() }
      this.fetchBookmarkByCampPlaceId().then(result => {
        this.bookmarkList = result
      })
    },
    findBookmarkId: function() {
      const bookmark = this.bookmarkList.find((bookmark) => {
        return (bookmark.user_id === this.userId)
      })
      if (bookmark) { return bookmark.id }
    }
  }
}
</script>
