require 'active_record'

module TodoMng

  # tasksテーブルを表現するモデルクラス
  class Task < ActiveRecord::Base

    NOT_YET = 0 # タスクが完了していない
    DONE    = 1 #タスク完了
    PENDING = 2 # 保留状態のタスク

    STATUS = {
      'NOT_YET' => NOT_YET,
      'DONE' => DONE,
      'PENDING' => PENDING
    }.freeze
  end

end



