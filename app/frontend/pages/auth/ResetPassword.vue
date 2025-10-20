<template>
  <div>
    <div class="absolute top-4 right-4">
      <ThemeToggler />
    </div>
    <FlashMessages />
    <div class="min-h-screen flex items-center justify-center">
      <div class="mx-auto grid w-[350px] gap-6">
        <div class="grid gap-2 text-center">
          <h1 class="text-3xl font-bold">
            Reset Password
          </h1>
          <p class="text-balance text-muted-foreground">
            Enter your new password below.
          </p>
        </div>
        <form class="grid gap-4" @submit.prevent="resetPassword">
          <input type="hidden" v-model="form.reset_password_token" />
          <div class="grid gap-2">
            <Label for="password">New Password</Label>
            <Input id="password" type="password" required v-model="form.password" />
            <p v-if="$page.props.errors.password" class="text-sm text-red-500">{{ $page.props.errors.password[0] }}</p>
          </div>
          <div class="grid gap-2">
            <Label for="password-confirmation">Confirm New Password</Label>
            <Input id="password-confirmation" type="password" required v-model="form.password_confirmation" />
            <p v-if="$page.props.errors.password_confirmation" class="text-sm text-red-500">{{ $page.props.errors.password_confirmation[0] }}</p>
          </div>
          <Button type="submit" class="w-full">
            Reset Password
          </Button>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup>
import { reactive, onMounted } from 'vue'
import { router } from '@inertiajs/vue3'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import FlashMessages from '@/components/FlashMessages.vue'
import ThemeToggler from '@/components/ThemeToggler.vue'

const form = reactive({
  password: '',
  password_confirmation: '',
  reset_password_token: ''
})

onMounted(() => {
  const urlParams = new URLSearchParams(window.location.search)
  form.reset_password_token = urlParams.get('reset_password_token')
})

function resetPassword() {
  router.put('/users/password', {
    user: {
      password: form.password,
      password_confirmation: form.password_confirmation,
      reset_password_token: form.reset_password_token
    }
  })
}
</script>
