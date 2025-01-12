<template>
	<view>
		<fui-swiper-dot :items="items" :current="current">
			<swiper class="fui-banner__wrap" @change="change" circular :indicator-dots="false" autoplay
				:interval="4000" :duration="150">
				<swiper-item v-for="(item,index) in items" :key="index">
					<view class="fui-banner__item" :style="{background:item.background}">PLM移动端审批</view>
				</swiper-item>
			</swiper>
		</fui-swiper-dot>
		<fui-tabs :tabs="tabs" :short="false" @change="changeTab"></fui-tabs>
		<view class="tabContent" style="height: calc(100vh - 560rpx);background-color: pink;">
			<MyTaskVue v-if="tabIndex === 0" @showDetail="showDetail"/>
			<AttentionTaskVue v-else-if="tabIndex === 1"/>
			<MyProductVue v-else-if="tabIndex === 2"/>
		</view>
		<ReViewInfoVue ref="reViewInfoRef"/>
	</view>
</template>

<script>
	import MyTaskVue from '@/components/ddplm/MyTask/MyTask.vue';
	import AttentionTaskVue from '@/components/ddplm/AttentionTask/AttentionTask.vue';
	import MyProductVue from '@/components/ddplm/MyProduct/MyProduct.vue';
	import ReViewInfoVue from '@/components/ddplm/ReViewInfo/ReViewInfo.vue';
  export default {
		components: {
			MyTaskVue,
			AttentionTaskVue,
			MyProductVue,
			ReViewInfoVue
		},
    onLoad: function() {
    },
		data() {
			return {
					current: 0, // 轮播图索引
					tabIndex: 0, // tab索引
					
					items: [{
						background: '#09BE4F'
					}, {
						background: '#FFB703'
					}, {
						background: '#B2B2B2'
					}],
					
					tabs: [{
							//（String）标签显示文本，可使用 nameKey 属性指定key（必选）
							name: '我的任务',
							//（Number | String | Boolean）角标，大于0的数或字符串则显示（可选）
							//isDot为true时可传true或false
							//（Boolean）是否禁用当前项（可选）
							disabled: false
						}, {
							//（String）标签显示文本，可使用 nameKey 属性指定key（必选）
							name: '参与产品',
							//（Number | String | Boolean）角标，大于0的数或字符串则显示（可选）
							//isDot为true时可传true或false
							//（Boolean）是否禁用当前项（可选）
							disabled: false
						}]
				}
		},
		methods: {
			change() {
			},
			showDetail(item) {
				this.$refs.reViewInfoRef.detailItem = item;
				this.$refs.reViewInfoRef.show = true;
			},
			changeTab(tabItem) {
				this.tabIndex = tabItem.index
			}
		}
  }
</script>

<style>
  .content {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
  }

  .logo {
    height: 200rpx;
    width: 200rpx;
    margin-top: 200rpx;
    margin-left: auto;
    margin-right: auto;
    margin-bottom: 50rpx;
  }

  .text-area {
    display: flex;
    justify-content: center;
  }

  .title {
    font-size: 36rpx;
    color: #8f8f94;
  }
	
	.fui-banner__item {
		width: 100%;
		height: 360rpx;
		color: #FFFFFF;
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 34rpx;
		font-weight: 600;
	}
	
	.fui-banner__wrap {
		height: 360rpx;
	}
	
	
</style>
