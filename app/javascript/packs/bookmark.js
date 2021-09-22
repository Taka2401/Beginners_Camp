import Vue from 'vue/dist/vue.esm.js'
import BookmarkButton from '../components/BookmarkButton.vue'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#Bookmark',
    components: { BookmarkButton },
  })
});
