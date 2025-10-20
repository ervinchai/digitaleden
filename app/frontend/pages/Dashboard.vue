<template>
  <div class="p-6">
    <div class="flex justify-between items-center">
      <h1 class="text-2xl font-bold">Dashboard</h1>
      <ThemeToggler />
    </div>
    <p class="mt-2" v-if="$page.props.auth.user">Welcome, {{ $page.props.auth.user.email }}</p>

    <Button @click="logout" variant="destructive" class="mt-4">
      Logout
    </Button>
  </div>
</template>

<script setup>
import { router } from '@inertiajs/vue3'
import { Button } from '@/components/ui/button'
import ThemeToggler from '@/components/ThemeToggler.vue'

function logout() {
  router.delete('/users/sign_out')
}
</script>
