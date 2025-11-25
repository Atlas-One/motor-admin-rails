<template>
  <div class="resource-settings-page">
    <div class="settings-header">
      <VButton
        icon="ios-arrow-back"
        @click="goBack"
      >
        {{ i18n.back }}
      </VButton>
      <h2 class="settings-title">
        {{ pageTitle }}
      </h2>
    </div>
    <div class="settings-content">
      <ResourceSettings
        v-if="resource"
        :resource="resource"
        :active-tab="activeTab"
        @back="goBack"
      />
    </div>
  </div>
</template>

<script>
import ResourceSettings from '../components/resource'
import { modelNameMap } from 'data_resources/scripts/schema'
import { toggleSettings, closeSettings } from 'settings/scripts/toggle'

export default {
  name: 'ResourceSettingsPage',
  components: {
    ResourceSettings
  },
  data () {
    return {
      resource: null,
      activeTab: this.$route.query.tab || 'query_editor'
    }
  },
  computed: {
    pageTitle () {
      if (this.resource) {
        return this.i18n.resource_settings.replace('%{resource}', this.resource.display_name)
      }
      return this.i18n.settings
    }
  },
  mounted () {
    this.loadResource()
    // Set settings as open when this page is mounted
    toggleSettings()
  },
  beforeUnmount () {
    // Close settings when leaving this page
    closeSettings()
  },
  methods: {
    loadResource () {
      const resourceName = this.$route.params.resource_name
      this.resource = modelNameMap[resourceName]
      
      if (!this.resource) {
        this.$router.push({ name: 'home' })
      }
    },
    goBack () {
      if (window.history.length > 1) {
        this.$router.go(-1)
      } else {
        this.$router.push({ name: 'home' })
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.resource-settings-page {
  padding: 20px;
  width: 100%;
  height: 100%;
}

.settings-header {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
  padding-bottom: 15px;
  border-bottom: 1px solid #dcdee2;
}

.settings-title {
  margin: 0 0 0 15px;
  font-size: 24px;
  font-weight: 500;
}

.settings-content {
  background: white;
  border-radius: 4px;
  padding: 20px;
  width: 100%;
}
</style>

