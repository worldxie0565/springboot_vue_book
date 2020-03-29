<template>
  <div class="wrap">
    <div style="text-align: center">
      <template >
        <el-table
                :data="tableData"
                style="width: 100%"
                max-height="400">
          <el-table-column
                  fixed
                  prop="id"
                  label="编号"
                  width="150">
          </el-table-column>
          <el-table-column
                  prop="name"
                  label="图书名称"
                  width="120">
          </el-table-column>
          <el-table-column
                  prop="author"
                  label="作者"
                  width="120">
          </el-table-column>
          <el-table-column
                  label="操作"
                  width="120">
            <template slot-scope="scope">
              <el-button
                      @click.native.prevent="editRow(scope.row)"
                      type="text"
                      size="small">
                编辑
              </el-button>
              <el-button
                      @click.native.prevent="deleteRow(scope.row)"
                      type="text"
                      size="small">
                移除
              </el-button>
            </template>
          </el-table-column>
        </el-table>
      </template>
    </div>
    <div class="block" style="margin-top: 10px;text-align: left;">
      <el-pagination
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
              :page-sizes="[10, 20, 50]"
              :page-size="pageSize"
              :total="total"
              layout="total, sizes, prev, pager, next, jumper">
      </el-pagination>
    </div>

  </div>

</template>

<script>
    export default {
        methods: {
            editRow(row) {
              this.$router.push({
                  path: '/page3',
                  query: {
                      id: row.id
                  }
              })
            },
            deleteRow(row) {
                axios.delete('http://localhost:8081/book/deleteById/' + row.id).then(resp=>{
                    this.$alert('《' + row.name + '》' + '删除成功', '消息', {
                        confirmButtonText: '确定',
                        callback: action => {
                            window.location.reload()
                        }
                    });
                })
            },
            handleCurrentChange(data){
                axios.get('http://localhost:8081/book/findAll/'+ (data-1) +'/' + this.pageSize).then(resp => {
                    this.tableData = resp.data.content
                    this.total = resp.data.totalElements
                    this.pageSize = resp.data.size
                })
            },
            handleSizeChange(data){
              axios.get('http://localhost:8081/book/findAll/0/' + data).then(resp => {
                  this.tableData = resp.data.content
                  this.total = resp.data.totalElements
                  this.pageSize = resp.data.size
              })
              this.pageSize = data

            }
        },

        data() {
            return {
                tableData: [],
                pageSize: 10,
                total: 0

            }
        },
        created() {
            axios.get('http://localhost:8081/book/findAll/0/' + this.pageSize).then(resp => {
                this.tableData = resp.data.content
                this.total = resp.data.totalElements
                this.pageSize = resp.data.size
            })
        }

    }
</script>

