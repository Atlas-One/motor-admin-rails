<template>
  <div>
    <div
      class="ivu-card ivu-card-bordered"
    >
      <div class="ivu-card-body py-0">
        <div
          class="cursor-pointer d-flex align-items-center justify-content-between py-2"
          :style="{ opacity: !isForm && !tab.visible ? 0.5 : 1 }"
          @click="toggleForm"
        >
          <div class="d-flex align-items-center">
            <Icon
              v-if="movable"
              type="ios-menu"
              class="me-3 cursor-grab"
            />
            <Checkbox
              v-if="'summary' !== tab.name"
              :model-value="tab.visible"
              @click.stop
              @on-change="toggleVisible"
            />
            <p
              ref="contenteditable"
              class="fs-5 fw-bold cursor-text"
              :contenteditable="'summary' !== tab.name"
              @input="updateName"
              @click="onTextClick"
              @blur="onNameFocusLost"
              @keydown.enter.prevent="$refs.contenteditable.blur()"
            >
              {{ displayName }}
            </p>
          </div>
          <div class="d-flex align-items-center">
            <Icon :type="isForm ? 'ios-arrow-up' : 'ios-arrow-down'" />
          </div>
        </div>
        <TabForm
          v-if="isForm"
          :tab="tab"
          class="py-3"
          :with-remove="'summary' !== tab.name"
          :with-name="'summary' !== tab.name"
          :resource="resource"
          @cancel="toggleForm"
          @remove="removeTab"
          @submit="updateTab"
        />
      </div>
    </div>
  </div>
</template>

<script>
import api from 'api'
import TabForm from './resource_tab_form'

export default {
  name: 'ResourceTab',
  components: {
    TabForm
  },
  props: {
    resource: {
      type: Object,
      required: true
    },
    movable: {
      type: Boolean,
      required: false,
      default: true
    },
    tab: {
      type: Object,
      required: true
    }
  },
  data () {
    return {
      isForm: false,
      displayName: this.tab.display_name
    }
  },
  watch: {
    'tab.display_name' (value) {
      if (value.trim() !== this.displayName.trim() &&
        value.trim() !== this.$refs.contenteditable.innerText.trim()) {
        this.displayName = this.tab.display_name
      }
    }
  },
  methods: {
    removeTab () {
      this.$Dialog.confirm({
        title: 'Are you sure?',
        closable: true,
        onOk: () => {
          const index = this.resource.tabs.findIndex((tab) => tab.name === this.tab.name)

          this.removeRequest()
          this.resource.tabs.splice(index, 1)
        }
      })
    },
    removeRequest () {
      return api.post('resources', {
        data: {
          name: this.resource.name,
          preferences: {
            tabs: [
              {
                name: this.tab.name,
                _remove: true
              }
            ]
          }
        }
      }).then((result) => {
      }).catch((error) => {
        console.error(error)
      })
    },
    persistChanges () {
      return api.post('resources', {
        data: {
          name: this.resource.name,
          preferences: {
            tabs: [
              this.tab
            ]
          }
        }
      }).then((result) => {
      }).catch((error) => {
        console.error(error)
      })
    },
    toggleVisible (value) {
      this.tab.visible = value

      this.persistChanges()
    },
    toggleForm () {
      this.isForm = !this.isForm
    },
    updateName (event) {
      this.tab.display_name = event.target.innerText
    },
    onTextClick (event) {
      if (this.tab.name === 'summary') {
        event.stopPropagation()
      }
    },
    updateTab (tab) {
      this.isForm = false

      Object.assign(this.tab, tab)

      this.persistChanges()
    },
    onNameFocusLost () {
      if (!this.tab.display_name || this.tab.display_name.match(/^\s+$/)) {
        this.tab.display_name = this.displayName
        this.displayName = this.displayName + ' '
      } else {
        this.persistChanges()

        this.displayName = this.tab.display_name
      }
    }
  }
}
</script>