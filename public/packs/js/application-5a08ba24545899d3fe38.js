/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/application.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/application.js":
/*!*********************************************!*\
  !*** ./app/javascript/packs/application.js ***!
  \*********************************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var cocoon__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! cocoon */ "./node_modules/cocoon/app/assets/javascripts/cocoon.js");
/* harmony import */ var cocoon__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(cocoon__WEBPACK_IMPORTED_MODULE_0__);
__webpack_require__(!(function webpackMissingModule() { var e = new Error("Cannot find module '@rails/ujs'"); e.code = 'MODULE_NOT_FOUND'; throw e; }())).start();

__webpack_require__(!(function webpackMissingModule() { var e = new Error("Cannot find module 'jquery'"); e.code = 'MODULE_NOT_FOUND'; throw e; }()));



/***/ }),

/***/ "./node_modules/cocoon/app/assets/javascripts/cocoon.js":
/*!**************************************************************!*\
  !*** ./node_modules/cocoon/app/assets/javascripts/cocoon.js ***!
  \**************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

(function ($) {
  var cocoon_element_counter = 0;

  var create_new_id = function create_new_id() {
    return new Date().getTime() + cocoon_element_counter++;
  };

  var newcontent_braced = function newcontent_braced(id) {
    return '[' + id + ']$1';
  };

  var newcontent_underscord = function newcontent_underscord(id) {
    return '_' + id + '_$1';
  };

  var getInsertionNodeElem = function getInsertionNodeElem(insertionNode, insertionTraversal, $this) {
    if (!insertionNode) {
      return $this.parent();
    }

    if (typeof insertionNode == 'function') {
      if (insertionTraversal) {
        console.warn('association-insertion-traversal is ignored, because association-insertion-node is given as a function.');
      }

      return insertionNode($this);
    }

    if (typeof insertionNode == 'string') {
      if (insertionTraversal) {
        return $this[insertionTraversal](insertionNode);
      } else {
        return insertionNode == "this" ? $this : $(insertionNode);
      }
    }
  };

  $(document).on('click', '.add_fields', function (e) {
    e.preventDefault();
    var $this = $(this),
        assoc = $this.data('association'),
        assocs = $this.data('associations'),
        content = $this.data('association-insertion-template'),
        insertionMethod = $this.data('association-insertion-method') || $this.data('association-insertion-position') || 'before',
        insertionNode = $this.data('association-insertion-node'),
        insertionTraversal = $this.data('association-insertion-traversal'),
        count = parseInt($this.data('count'), 10),
        regexp_braced = new RegExp('\\[new_' + assoc + '\\](.*?\\s)', 'g'),
        regexp_underscord = new RegExp('_new_' + assoc + '_(\\w*)', 'g'),
        new_id = create_new_id(),
        new_content = content.replace(regexp_braced, newcontent_braced(new_id)),
        new_contents = [];

    if (new_content == content) {
      regexp_braced = new RegExp('\\[new_' + assocs + '\\](.*?\\s)', 'g');
      regexp_underscord = new RegExp('_new_' + assocs + '_(\\w*)', 'g');
      new_content = content.replace(regexp_braced, newcontent_braced(new_id));
    }

    new_content = new_content.replace(regexp_underscord, newcontent_underscord(new_id));
    new_contents = [new_content];
    count = isNaN(count) ? 1 : Math.max(count, 1);
    count -= 1;

    while (count) {
      new_id = create_new_id();
      new_content = content.replace(regexp_braced, newcontent_braced(new_id));
      new_content = new_content.replace(regexp_underscord, newcontent_underscord(new_id));
      new_contents.push(new_content);
      count -= 1;
    }

    var insertionNodeElem = getInsertionNodeElem(insertionNode, insertionTraversal, $this);

    if (!insertionNodeElem || insertionNodeElem.length == 0) {
      console.warn("Couldn't find the element to insert the template. Make sure your `data-association-insertion-*` on `link_to_add_association` is correct.");
    }

    $.each(new_contents, function (i, node) {
      var contentNode = $(node);
      insertionNodeElem.trigger('cocoon:before-insert', [contentNode]); // allow any of the jquery dom manipulation methods (after, before, append, prepend, etc)
      // to be called on the node.  allows the insertion node to be the parent of the inserted
      // code and doesn't force it to be a sibling like after/before does. default: 'before'

      var addedContent = insertionNodeElem[insertionMethod](contentNode);
      insertionNodeElem.trigger('cocoon:after-insert', [contentNode]);
    });
  });
  $(document).on('click', '.remove_fields.dynamic, .remove_fields.existing', function (e) {
    var $this = $(this),
        wrapper_class = $this.data('wrapper-class') || 'nested-fields',
        node_to_delete = $this.closest('.' + wrapper_class),
        trigger_node = node_to_delete.parent();
    e.preventDefault();
    trigger_node.trigger('cocoon:before-remove', [node_to_delete]);
    var timeout = trigger_node.data('remove-timeout') || 0;
    setTimeout(function () {
      if ($this.hasClass('dynamic')) {
        node_to_delete.remove();
      } else {
        $this.prev("input[type=hidden]").val("1");
        node_to_delete.hide();
      }

      trigger_node.trigger('cocoon:after-remove', [node_to_delete]);
    }, timeout);
  });
  $(document).on("ready page:load turbolinks:load", function () {
    $('.remove_fields.existing.destroyed').each(function (i, obj) {
      var $this = $(this),
          wrapper_class = $this.data('wrapper-class') || 'nested-fields';
      $this.closest('.' + wrapper_class).hide();
    });
  });
})(jQuery);

/***/ })

/******/ });
//# sourceMappingURL=application-5a08ba24545899d3fe38.js.map