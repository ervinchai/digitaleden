import { onMounted, ref, watch } from 'vue'

const isDark = ref(false)

export function useTheme() {
  function toggleDark() {
    isDark.value = !isDark.value
  }

  onMounted(() => {
    const storedTheme = localStorage.getItem('theme')
    if (storedTheme === 'dark' || (storedTheme === null && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      isDark.value = true
    }
  })

  watch(isDark, (newVal) => {
    if (newVal) {
      document.documentElement.classList.add('dark')
      localStorage.setItem('theme', 'dark')
    } else {
      document.documentElement.classList.remove('dark')
      localStorage.setItem('theme', 'light')
    }
  })

  return {
    isDark,
    toggleDark,
  }
}
