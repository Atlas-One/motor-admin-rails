import { ref } from 'vue'
import router from 'router'

const isShowSettingsRef = ref(false)

function toggleSettings () {
  isShowSettingsRef.value = !isShowSettingsRef.value
}

function closeSettings () {
  isShowSettingsRef.value = false

  // If we're on the resource settings page, navigate back
  if (router.currentRoute.value.name === 'resource_settings') {
    if (window.history.length > 1) {
      router.go(-1)
    } else {
      router.push({ name: 'home' })
    }
  }
}

function isShowSettings () {
  return isShowSettingsRef.value
}

export { isShowSettings, toggleSettings, closeSettings }
