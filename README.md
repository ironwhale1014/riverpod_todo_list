# riverpod_filter_train

riverpod filter train

## 순서

1. 패키지 설치
   flutter pub add hooks_riverpod
   flutter pub add flutter_hooks
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
3. main 함수에 ProviderScope 설정
4. common - layout - default_layout 만들기
5. domain - todo.dart 만들기

- 더미 데이터인 initialMemo 만들기

6. TodoListService

- List<Todo> 상태 관리하고 할일을 CRUD 하기 위한 서비스 로직 구현
- uuid: ^4.5.1 필요

7. Todo filter 만들기

- 필터의 상태관리를 위한 TodoListFilterNotifier 만들기 필터의 상태를 변경할수 있는 함수도 만듬
- enum TodoListFilter 만들기

8. List<Todo> filteredTodos

- **필터 조건에 따라 List<Todo>를 필터링한 결과물을 리턴하는 함수**
- todoListServiceProvider, todoListFilterNotifierProvider를 watch하여 둘중 하나만 바뀌어도 재생성하도록 함
9. UncompletedTodosCountProvider
- **완료되지 않은 리스트 갯수 세는 프로바이더**
10. Home UI 구성