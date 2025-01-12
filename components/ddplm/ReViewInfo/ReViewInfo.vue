<template>
	<view>
		<fui-bottom-popup :show="show" @close="closePopup">
			<view class="fui-scroll__wrap">
				<view class="fui-title">
					<text style="margin-right: 5px;"> {{ detailItem.title}} </text>
					<fui-tag :text="detailItem.owner" type="primary" :size="24" scaleRatio="0.7"></fui-tag>
				</view>
				<scroll-view scroll-y class="fui-scroll__view">
					
				</scroll-view>
				<view style="position: relative; width: 100%;height: 200rpx;bottom: 0;">
					<hr/>
					<view class="flex justify-end">
						<fui-button type="primary" style="margin: 10px;" btnSize="mini">通过</fui-button>
						<fui-button type="warning" style="margin: 10px;" btnSize="mini">驳回</fui-button>
					</view>
				</view>
				<view class="fui-icon__close" @tap="closePopup">
					<fui-icon name="close" :size="48"></fui-icon>
				</view>
			</view>
		</fui-bottom-popup>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				show: false, // 详细页面
				detailItem: {},
			};
		},
		methods: {
			closePopup() {
				this.show = false;
			},
		}
	}
</script>

<style lang="less">

	.fui-scroll__wrap {
		padding-top: 30rpx;
		position: relative;
	}
	.fui-title {
		font-size: 30rpx;
		font-weight: bold;
		text-align: center;
		padding-bottom: 24rpx;
	}
	.fui-icon__close {
		position: absolute;
		top: 24rpx;
		left: 24rpx;
	}
	
	.fui-scroll__view {
		width: 100%;
		// height: calc(100vh - 900rpx);
		height: 600rpx;
	}
</style>
