//GENERAL
protocol Like {
  var likes: Int { get }
  var liked: Bool { get }
}
protocol Time {
  var createdAt: String? { get }
  var updatedAt: String? { get }
}

enum TableNameEnum: String {
  case Comments
  case FileComments
  case SubComments
  case LastComments
}

enum Tags: String {
  case realistic
  case manga
  case anime
  case comics
  case photographs
  case videos
  case animations
  case others
  case profile
  case group
} 

enum LangType: String {
  case en
  case pl
  case jp
} 
enum IndexType: String {
  case photographs
  case videos
  case animations
} 

enum Provider: String, Decodable {
  case ewmail
  case google
  case discord
  case spotify
}

//FORMS CONTROLLERS ELEMENTS
enum RoleType: String {
  case ADMIN
  case MODERATOR
  case USER
  case AUTHOR
}

enum Plan: String, Decodable {
  case FREE
  case PREMIUM
  case GOLD
}

protocol NewPlanType {
  var newPlan: Plan? { get }
} 

//DATE OBJECT
struct DateObjectType  {
  var second: String 
  var minute: String 
  var hour: String 
  var day: String 
  var yearDateSeparator: String 
}

//USERS
struct UserType: Decodable, Time {
  var id: String?
  var pseudonym: String
  var description: String?
  var profilePhoto: String?
  var email: String
  var plan: Plan
  var provider: Provider?
  var createdAt: String?
  var updatedAt: String?
  } 

struct UserFormType {
  var email: String
  var password: String?
} 

//PROFILE
struct Language {
  var userAvatar: String
  var defaultAvatar: String
  var pseudonym: String
  var aboutMe: String?
}

struct ProfileType {
  var language: Language
  var pseudonym: String
  var description: String
  var fileUrl: String
}

//FILES
struct FileType: Time {
  var fileId: String?
  var name: String?
  var shortDescription: String?
  var tags: Tags?
  var pseudonym: String?
  var authorProfilePhoto: String?
  var authorName: String
  var profileType: Bool?
  var authorId: String
  var fileUrl: String
  var time: String
  var roleId: String?
  var createdAt: String?
  var updatedAt: String?
}

struct ArticleVideosType  {
  var fileId: String
  var name: String
  var fileUrl: String
  var shortDescription: String
  var authorName: String
  var authorBool: Bool
  var profilePhoto: String
  var tags: Tags
  var authorId: String
  var time: String
  var roleId: String
}

//FRIENDS
  struct FriendType: Time {
  var id: String?
  var usernameId: String
  var favorite: Bool
  var pseudonym: String
  var profilePhoto: String
  var time: String?
  var createdAt: String?
  var updatedAt: String?
}

struct FriendsListArrayType {
  var pseudonym: String
  var profilePhoto: String
  var favorites: Int
}

struct FriendsListType {
  var fileUrl: String
  var pseudonym: String
  var plan: Plan
  var favorite: Bool
  var createdAt: String
}

//GROUPS
struct GroupType: Time {
  var groupId: String?
  var name: String?
  var description: String
  var regulation: String
  var logo: String
  var usersGroupsId: String
  var favorited: Bool
  var favorites: Int
  var role: RoleType
  var roleId: String
  var time: String?
  var createdAt: String?
  var updatedAt: String?
}

struct GroupsType {
  var name: String
  var description: String
  var logo: String
}

struct GroupListType {
  var name: String
  var fileUrl: String
}

struct GroupUserType {
  var name: String
  var logo: String
  var groupId: String
}

struct MemberType {
  var usersGroupsId: String?
  var pseudonym: String
  var profilePhoto: String
  var role: RoleType
}

struct GroupUsersType {
  var name: String
  var logo: String
}

struct JoinUser {
  var logo: String
  var description: String
  var regulation: String
  var join: Bool
  var favorite: Bool
  var favoriteLength: Int
  var admin: Bool
  var groupId: String
  var roleId: String
  var usersGroupsId: String
}

struct UpdateLogo {
  var upload: String
  var notUpload: String
  var validateRequired: String
  var cancelButton: String
  var submit: String
}
  
struct JoinedUser {
  var join: String
  var joined: String
  var addedToFav: String
  var addToFav: String
  var addToFavorite: String
  var maxFav: String
  var maximumAchieved: String
}

struct GroupSections {
  var general: String
  var members: String
  var description: String
  var noPermission: String
  var deleteGroup: String
}
  
struct Members {
  var admin: String
  var moderators: String
  var modsAria: String
  var noMods: String
  var anotherMembers: String
  var addModAria: String
  var noMembers: String
}

struct Posts {
  var add: String
  var addTitPlaceholder: String
  var addTitAria: String
  var addDescription: String
  var addDesAria: String
}

struct nameGroupTranslatedType {
  var updateLogo: UpdateLogo?
  var joinedUser: JoinUser?
  var groupSections: GroupSections?
  var members: Members?
  var posts: Posts?
  var error: String?
  var noRegulation: String?
}

//POSTS
struct PostsType: Time, Like {
  var authorName: String
  var authorProfilePhoto: String 
  var postId: String? 
  var authorId: String 
  var title: String 
  var content: String 
  var likes: Int
  var liked: Bool
  var shared: Int
  var commented: Int
  var groupId: String
  var roleId: String
  var date: String?
  var idLiked: String
  var createdAt: String?
  var updatedAt: String?
}

struct FirstModsUsersList {
  var members: [GroupUserType]
  var moderators: [GroupUserType]
}

//GALLERY
struct TDash {
  var friends: String
  var groups: String
  var photos: String
  var animations: String
  var videos: String
}

struct TGallery {
  var userPhotosTitle: String
  var userAnimationsTitle: String
  var userVideosTitle: String
  var noPhotos: String
  var noAnimations: String
  var noVideos: String
}

struct TFriends {
  var friends: String
  var noFriends: String
}
  
struct GalleryType {
  var id: String
  var pseudonym: String?
  var profilePhoto: String 
  var author: String 
  var firstGraphics: [FileType]?
  var firstAnimations: [FileType]?
  var firstVideos: [FileType]?
  var firstFriendsList: [FriendsListType]?
  var firstAdminList: [GroupUserType]?
  var firstModsUsersList: FirstModsUsersList?
  var tDash: TDash?
  var tGallery: TGallery?
  var tFriends: TFriends?
}

// COMMENTS
protocol Comment: Time {
  var authorId: String { get }
  var fileUrl: String? { get }
  var roleId: String? { get }
  var role: RoleType { get }
  var date: String? { get }
  var pseudonym: String? { get }
  var content: String { get }
  var liked:  Bool { get }
  var likes: Int { get }
}

struct NewCommentsType {
  var authorId: String
  var profilePhoto: String?
  var roleId: String
  var content: String
  var fileId: String?
  var postId: String?
  var fileCommentId: String?
  var commentId: String?
  var subCommentId: String?
}

struct CommentType: Comment {
  var authorName: String
  var authorProfilePhoto: String
  var commentId: String
  var postId: String
  var authorId: String
  var fileUrl: String?
  var roleId: String?
  var role: RoleType
  var date: String?
  var pseudonym: String?
  var content: String
  var liked: Bool
  var likes: Int
  var createdAt: String?
  var updatedAt: String?
}

struct FilesCommentsType: Comment {
  var authorId: String
  var authorName: String
  var authorProfilePhoto: String
  var fileCommentId: String
  var fileId: String?
  var fileUrl: String?
  var roleId: String?
  var role: RoleType
  var date: String?
  var pseudonym: String?
  var content: String
  var liked: Bool
  var likes: Int
  var createdAt: String?
  var updatedAt: String?
}

struct SubCommentType: Comment {
  var authorId: String
  var authorName: String
  var authorProfilePhoto: String 
  var subCommentId: String 
  var profilePhoto: String? 
  var commentId: String? 
  var fileCommentId: String? 
  var fileId: String? 
  var postId: String? 
  var groupsPostsRoleId: String?
  var fileUrl: String?
  var roleId: String?
  var role: RoleType
  var date: String?
  var pseudonym: String?
  var content: String
  var liked: Bool
  var likes: Int
  var createdAt: String?
  var updatedAt: String?
}

struct LastCommentType: Comment {
  var authorId: String
  var authorName: String
  var authorProfilePhoto: String 
  var lastCommentId: String 
  var subCommentId: String
  var fileUrl: String?
  var roleId: String?
  var role: RoleType
  var date: String?
  var pseudonym: String?
  var content: String
  var liked: Bool
  var likes: Int
  var createdAt: String?
  var updatedAt: String?
}
