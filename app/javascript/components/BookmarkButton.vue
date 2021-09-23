<template>
  <div>
    <div v-if="isBookmarked" @click="deleteBookmark()" class="btn btn-primary">
      ブックマーク中
    </div>
    <div v-else @click="registerBookmark()" class="btn btn-success">
      ブックマーク
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()

export default {
  // ユーザー、キャンプ場のIDを取得
  props: ['userId', 'campPlaceId'],
  data() {
    return {
      // 配列にデータを格納する
      bookmarkList: []
    }
  },
  computed: {
    count() {
      // 配列の数
      return this.bookmarkList.length;
    },
    isBookmarked() {
      // ブックマークしたことがあればtrueを返す
      if (this.bookmarkList.length === 0) { return false }
      // bookmark.user_idとcurrent_user_idが一致するか確認
      return Boolean(this.findBookmarkId())
    }
  },
  created: function() {
    this.fetchBookmarkByCampPlaceId().then(result => {
      // 登録データを配列に格納
      this.bookmarkList = result
    })
  },
  methods: {
    fetchBookmarkByCampPlaceId: async function() {
      // user_id、camp_place_idを取得
      const res = await axios.get(`/api/v1/bookmarks/?camp_place_id=${this.campPlaceId}`)
      if (res.status !== 200) { process.exit() }
      // 取得できたらリターン
      return res.data
    },
    registerBookmark: async function() {
      const res = await axios.post('/api/v1/bookmarks/', {
        // propsで受け取ったIdを代入して送信
        camp_place_id: this.campPlaceId
      })
      if (res.status !== 201) { return process.exit() }
      this.fetchBookmarkByCampPlaceId().then(result => {
        // 送信成功したら配列に格納
        this.bookmarkList = result
      })
    },
    deleteBookmark: async function() {
      // 登録データを取得
      const bookmarkId = this.findBookmarkId()
      const res = await axios.delete(`/api/v1/bookmarks/${bookmarkId}`)
      if (res.status !== 200) { return process.exit() }
      // 削除したIdを代入
        this.bookmarkList = this.bookmarkList.filter(n => n.id !== bookmarkId)
    },
    findBookmarkId: function() {
      const bookmark = this.bookmarkList.find((bookmark) => {
      // propで受け取ったIdが登録されているか確認
        return (bookmark.user_id === this.userId)
      })
      // 登録されていればリターン
      if (bookmark) { return bookmark.id }
    }
  }
}
</script>
