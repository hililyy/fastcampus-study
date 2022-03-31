import UIKit

protocol WriteDiaryViewDelegate : AnyObject{
    func didSelectRegister(diary: Diary)
}

class WriteDiaryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var confirmButton: UIBarButtonItem!
    
    private let datePicker = UIDatePicker()
    private var diaryDate: Date? //DatePicker에서 선택된 Date를 선택하는 프로퍼티
    
    weak var delegate : WriteDiaryViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContentsTextView()
        self.configureDatePicker()
        self.configureInputField()
        self.confirmButton.isEnabled = false // 등록버튼 비활성화되게 하려고
        titleTextField.delegate = self
    }
    
    // textfield 모서리 효과
    private func configureContentsTextView() {
        let borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        self.contentsTextView.layer.borderColor = borderColor.cgColor
        //cgColor -> 레이어 관련 색상 설정시에는 UIColor 사용 x
        self.contentsTextView.layer.borderWidth = 0.5
        self.contentsTextView.layer.cornerRadius = 5.0
        //cornerRadius : 모서리를 둥글게
    }
    //날짜 textfield에 키보드 대신 datepicker가 나오도록
    private func configureDatePicker() {
        self.datePicker.datePickerMode = .date //날짜만 나오게
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.addTarget(self, action: #selector(datePickerVlaueDidChange(_:)), for: .valueChanged)
        // 1. 해당 뷰 컨트롤러에서 처리할것이기 때문에 self로
        // 2. 이벤트가 발생하였을 때 응답하여 호출할 메서드를 selector로 넘겨주면 됨
        self.datePicker.locale = Locale(identifier: "ko-KR")
        self.dateTextField.inputView = self.datePicker
    }
    
    
    private func configureInputField() {
        self.contentsTextView.delegate = self
        self.titleTextField.addTarget(self, action: #selector(titleTextFieldDidChange(_:)), for: .editingChanged)
        self.dateTextField.addTarget(self, action: #selector(dateTextFieldDidChange(_:)), for: .editingChanged)
    }
    
    @IBAction func tabConfirmButton(_ sender: UIBarButtonItem) {
        guard let title = self.titleTextField.text else { return }
        guard let contents = self.contentsTextView.text else { return }
        guard let date = self.diaryDate else { return }
        let diary = Diary(title: title, contents: contents, date: date, isStar: false)
        self.delegate?.didSelectRegister(diary: diary)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func datePickerVlaueDidChange(_ datePicker: UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일(EEEEE)"
        //E 5번 -> 요일을 한글자만 표현하게
        formatter.locale = Locale(identifier: "ko_KR")
        self.diaryDate = datePicker.date
        self.dateTextField.text = formatter.string(from: datePicker.date)
        self.dateTextField.sendActions(for: .editingChanged) // 날짜가 변경될 때 마다 editingChanged액션을 발생시켜 dateTextFieldDidChange메서드가 호출된다.
    }
    
    @objc private func titleTextFieldDidChange(_ textField: UITextField) {
        self.validateInputField()
    }
    // 날자가 변경될 때 마다 등록버튼 활성화 여부 판단
    @objc private func dateTextFieldDidChange(_ textField: UITextField) {
        self.validateInputField()
    }
    //빈화면 눌렀을 때 키보드 사라지게
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        return true
    }
    // 세가지 항목이 모두 비어있지 않을때 true로 해준다.
    private func validateInputField() {
        self.confirmButton.isEnabled = !(self.titleTextField.text?.isEmpty ?? true) && !(self.dateTextField.text?.isEmpty ?? true) && !self.contentsTextView.text.isEmpty
    }
}
//extension을 이용하여 UITextViewDelegate를 채택함
extension WriteDiaryViewController : UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        self.validateInputField()
    }
}
