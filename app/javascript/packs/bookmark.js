import Vue from 'vue/dist/vue.esm.js'
import BookmarkButton from '../components/Bookmark/BookmarkButton.vue'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#bookmark',
    components: { BookmarkButton },
  })
});
