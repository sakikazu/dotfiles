== expected
==比較の結果が同じか
be_true
真であるか
be_false
偽であるか
be_nil
nilか
be_empty
Arrayが空か
be_an_instance_of Class
クラスがClassと一致するか
be_a_kind_of Class
クラスが指定Class、もしくはそのサブクラスか
have_key key
keyがあるか
be_close E,D
数値が、E～Dの範囲に収まっているか
change receiver,message,&block
Procオブジェクトが変化するか
change(receiver,message,&block).by value
Procオブジェクトが指定された値で変化するか(should_notは使用できない)
change(receiver,message,&block).from(before).to(after)
Procオブジェクトがbeforeからafterに変化するか(should_notは使用できない)
eql expected
==とほぼ同義((eql?で比較)
equal expected
同じオブジェクトか
have(n).items
配列などのコレクションオブジェクトが、n個の要素を持っているか。
have_exactly(n).items
配列などのコレクションオブジェクトが、ちょうどn個の要素を持っているか。(should_notは使用できない)
have_at_least(n).items
配列などのコレクションオブジェクトが、n個以上の要素を持っているか。(should_notは使用できない)
have_at_most(n).items
配列などのコレクションオブジェクトが、n個以下の要素を持っているか。(should_notは使用できない)
include expected
配列などのコレクションオブジェクトに、expectedが入っているか。
match regexp
正規表現regexpにマッチするか。
raise_error
例外が発生するか。
raise_error Expected
Expectedな例外が発生するか。
raise_error Expected,message
Expectedな例外が、messageを伴って発生するか。
raise_error Expected,regexp
Expectedな例外が、正規表現にマッチするメッセージを伴って発生するか。
respond_to method,method,method...
  オブジェクトが、指定メソッドを全て持つか。
satisfy {｜e｜ ...}
ブロックの実行結果（eにテストオブジェクトが渡される）が真になるか。
thorw_symbol(symbol=nil)
symbolがthrowされるか。
