import Vue from 'vue/dist/vue.esm.js'
import RelationshipButton from '../components/Relationship/RelationshipButton.vue'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#relationship',
    components: { RelationshipButton },
  })
});
