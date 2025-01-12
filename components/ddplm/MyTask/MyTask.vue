<template>
	<view style="height: 100%;">
		<scroll-view v-if="taskData.length > 0" style="height:100%" :scroll-y="true" class="scroll-Y" :scroll-with-animation="true">
			<fui-list bottomBorder>
				<fui-list-cell v-for="(item,index) in taskData" @click="showDetail(item)" :highlight="false" :key="index" arrow class="list-cell-cls">
					<fui-card style="border:0;margin:0" :title="item.title" :tag="item.owner">
						<view v-if="item.remark" class="fui-card__content">{{item.remark}}</view>
					</fui-card>
				</fui-list-cell>
			</fui-list>
		</scroll-view>
		<fui-empty v-if="taskData.length === 0" src="/static/images/component/empty/img_data_3x.png" title="暂无数据" descr="功能开发中，敬请期待！">
		</fui-empty>

	</view>
</template>

<script>
	export default {
		created() {
			this.taskData = []
			for(var i =0;i<30;i++) {
				this.taskData.push({
					title: 'PR000'+i+'-测试变更请求',
					owner: '张三',
					remark: '测试内容' +i
				})
			}
		},
		data() {
			return {
				taskData: []
			};
		},
		methods: {
			showDetail(item) {
				this.$emit('showDetail', item)
			}
		}
	}
</script>

<style lang="less">
.list-cell-cls{
	padding: 0 15px 0 0 !important;
}
.fui-card__content{
	color: gray;
	font-size: 12px;
	padding: 5px;
}
// 滚动条样式
	/deep/ ::-webkit-scrollbar {
		/*滚动条整体样式*/
		width: 4px !important;
		height: 1px !important;
		overflow: auto !important;
		background: #ccc !important;
		-webkit-appearance: auto !important;
		display: block;
	}

	/deep/ ::-webkit-scrollbar-thumb {
		/*滚动条里面小方块*/
		border-radius: 10px !important;
		box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2) !important;
		background: #7b7979 !important;
	}

	/deep/ ::-webkit-scrollbar-track {
		/*滚动条里面轨道*/
		// box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2) !important;
		// border-radius: 10px !important;
		background: #FFFFFF !important;
	}
</style>
