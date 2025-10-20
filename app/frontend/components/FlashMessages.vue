<template>
  <div v-if="$page.props.flash.notice || $page.props.flash.alert" class="fixed top-0 right-0 m-6">
    <div v-if="$page.props.flash.notice" class="bg-green-500 text-white p-4 rounded-lg shadow-lg">
      {{ $page.props.flash.notice }}
    </div>
    <div v-if="$page.props.flash.alert" class="bg-red-500 text-white p-4 rounded-lg shadow-lg mt-2">
      {{ $page.props.flash.alert }}
    </div>
  </div>
</template>
