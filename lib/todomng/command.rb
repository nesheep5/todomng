module TodoMng

  # コマンドラインベースの処理を行うクラス
  class Command

    def execute
      DB.prepare
    end

    # タスク作成
    # @param [String] name 名前
    # @param [String] content タスク内容
    # @return [TodoMng::Task] タスクオブジェクト 
    def create_task(name, content)
      # タスク作成時のstatusはデフォルト値が使われNOT_YETとなる
      # Win環境などコマンドラインとプログラムでエンコードが異なる場合を考慮しreload
      Task.create!(name: name, content: content).reload
    end
    
    # タスク削除
    # @param [String] id
    def delete_task(id)
      task = Task.find(id)
      task.destroy
    end

    # タスク更新
    # @param [String] id
    # @param [Hash] attributes
    # @option attributes[String] :name 
    # @option attributes[String] :content
    # @option attributes[String] :status
    # @return [TodoMng::Task] タスクオブジェクト 
    def update_task(id, attributes)
      if status_name = attributes[:status]
        attributes[:status] = Task::STATUS.fetch(status_name.upcase)
        
      end

      task = Task.find(id)
      task.update_attributes! attributes

      task.reload
    end

    # タスク検索
    # @param [String] status_name
    # @return [ActiveRecord::Relation] 検索結果
    def find_task(status_name)
      all_tasks = Task.order('created_at DESC')

      if status_name
        status = Task::STATUS.fetch(status_name.upcase)
        all_tasks.status_is(status)
      
      else
        all_tasks
      
      end
    end
  end


end
