# riverpod_filter_train

riverpod filter train

## 순서
1. 패키지 설치

   flutter pub add flutter_riverpod  
   flutter pub add riverpod_annotation  
   flutter pub add dev:riverpod_generator  
   flutter pub add dev:build_runner  
   flutter pub add dev:custom_lint  
   flutter pub add dev:riverpod_lint
2. analysis_options.yaml 설정
   analyzer:  
   plugins:  
   \- custom_lint  
   사용법은 dart run custom_lint  
3. ProviderScope 설정
4. common - layout - default_layout 만들기
5. domain - todo.dart 만들기
- initialMemo 만들기
6. TodoListService  
- uuid: ^4.5.1 필요
7. 