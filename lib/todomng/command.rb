module TodoMng

  # コマンドラインベースの処理を行うクラス
  class Command

    def execute
      DB.prepare
    end

    def create_task(name, content)
      # タスク作成時のstatusはデフォルト値が使われNOT_YETとなる
      # Win環境などコマンドラインとプログラムで扱うエンコードが異なる場合を考慮しreload
      Task.create!(name: name, content: content).reload
    end

  end


end
