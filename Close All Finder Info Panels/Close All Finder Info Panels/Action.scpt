FasdUAS 1.101.10   ��   ��    l    � ����  O     �    k    �     	  l    	 
   
 r    	    2   ��
�� 
cwin  o      ���� 0 thewindowlist theWindowList    get all Finder windows      �   0   g e t   a l l   F i n d e r   w i n d o w s   	     l  
 
��������  ��  ��     ��  Y   
 � ��  ��  l   �     k    �       l         r         m    ��
�� boovfals   o      ���� 0 shouldclose shouldClose    reset to false      � ! !     r e s e t   t o   f a l s e     " # " l    # $ % & $ r    # ' ( ' n    ! ) * ) 4    !�� +
�� 
cobj + o     ���� 0 i   * o    ���� 0 thewindowlist theWindowList ( o      ���� 0 
thiswindow 
thisWindow % "  get a window from the list     & � , , 8   g e t   a   w i n d o w   f r o m   t h e   l i s t   #  - . - l   $ ) / 0 1 / r   $ ) 2 3 2 n   $ ' 4 5 4 1   % '��
�� 
pnam 5 o   $ %���� 0 
thiswindow 
thisWindow 3 o      ���� 0 
windowname 
windowName 0   get the window's name      1 � 6 6 0   g e t   t h e   w i n d o w ' s   n a m e     .  7 8 7 l  * *��������  ��  ��   8  9 : 9 l   * *�� ; <��   ; a [ this list should contain class property that tells you the type of window - which is nice     < � = = �   t h i s   l i s t   s h o u l d   c o n t a i n   c l a s s   p r o p e r t y   t h a t   t e l l s   y o u   t h e   t y p e   o f   w i n d o w   -   w h i c h   i s   n i c e   :  > ? > l   * *�� @ A��   @ m g Class would be either "Finder window" for normal windows or "information window" for the Info windows     A � B B �   C l a s s   w o u l d   b e   e i t h e r   " F i n d e r   w i n d o w "   f o r   n o r m a l   w i n d o w s   o r   " i n f o r m a t i o n   w i n d o w "   f o r   t h e   I n f o   w i n d o w s   ?  C D C l   * *�� E F��   E = 7 However, it doesn't contain the class property. alas.     F � G G n   H o w e v e r ,   i t   d o e s n ' t   c o n t a i n   t h e   c l a s s   p r o p e r t y .   a l a s .   D  H I H l   * *�� J K��   J D > So to differentiate, we can use the current view/panel props     K � L L |   S o   t o   d i f f e r e n t i a t e ,   w e   c a n   u s e   t h e   c u r r e n t   v i e w / p a n e l   p r o p s   I  M N M l   * *�� O P��   O T N Alas this means Summary Info panels are closed, but Inspector panels are not     P � Q Q �   A l a s   t h i s   m e a n s   S u m m a r y   I n f o   p a n e l s   a r e   c l o s e d ,   b u t   I n s p e c t o r   p a n e l s   a r e   n o t   N  R S R r   * 0 T U T e   * . V V n   * . W X W 1   + -��
�� 
pALL X o   * +���� 0 
thiswindow 
thisWindow U o      ���� 0 theproplist thePropList S  Y Z Y l  1 1��������  ��  ��   Z  [ \ [ l   1 1�� ] ^��   ] ; 5 in a try/catch as prop not set for the diff windows     ^ � _ _ j   i n   a   t r y / c a t c h   a s   p r o p   n o t   s e t   f o r   t h e   d i f f   w i n d o w s   \  ` a ` Q   1 L b c d b k   4 = e e  f g f r   4 9 h i h n   4 7 j k j 1   5 7��
�� 
panl k o   4 5���� 0 theproplist thePropList i o      ���� 0 currentview currentView g  l�� l l   : = m n o m r   : = p q p m   : ;��
�� boovtrue q o      ���� 0 shouldclose shouldClose n . ( no error, it's an info panel, so close     o � r r P   n o   e r r o r ,   i t ' s   a n   i n f o   p a n e l ,   s o   c l o s e  ��   c R      ������
�� .ascrerr ****      � ****��  ��   d I  E L�� s��
�� .ascrcmnt****      � **** s b   E H t u t m   E F v v � w w B N o t   a n   i n f o   p a n e l ,   l e a v i n g   o p e n :   u o   F G���� 0 
windowname 
windowName��   a  x y x l  M M��������  ��  ��   y  z { z l   M M�� | }��   | K E this try/catch is just for a double check, feel free to comment out     } � ~ ~ �   t h i s   t r y / c a t c h   i s   j u s t   f o r   a   d o u b l e   c h e c k ,   f e e l   f r e e   t o   c o m m e n t   o u t   {   �  Q   M r � � � � r   P W � � � n   P U � � � 1   Q U��
�� 
pvew � o   P Q���� 0 theproplist thePropList � o      ���� 0 currentview currentView � R      ������
�� .ascrerr ****      � ****��  ��   � Z  _ r � ����� � =   _ b � � � o   _ `���� 0 shouldclose shouldClose � m   ` a��
�� boovfals � I  e n�� ���
�� .ascrcmnt****      � **** � b   e j � � � m   e h � � � � � & N o t   a n   i n f o   p a n e l :   � o   h i���� 0 
windowname 
windowName��  ��  ��   �  � � � l  s s��������  ��  ��   �  ��� � Z   s � � ����� � F   s � � � � D   s x � � � o   s t���� 0 
windowname 
windowName � m   t w � � � � � 
   I n f o � o   { |���� 0 shouldclose shouldClose � k   � � � �  � � � I  � ��� ���
�� .coreclosnull���     obj  � o   � ����� 0 
thiswindow 
thisWindow��   �  ��� � I  � ��� ���
�� .ascrcmnt****      � **** � b   � � � � � m   � � � � � � � ( C l o s i n g   i n f o   p a n e l :   � o   � ����� 0 
windowname 
windowName��  ��  ��  ��  ��      loop through them      � � � &   l o o p   t h r o u g h   t h e m  �� 0 i    m    ����   n     � � � m    ��
�� 
nmbr � n    � � � 2   ��
�� 
cobj � o    ���� 0 thewindowlist theWindowList��  ��    m      � ��                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  ��       
�� � � ��� � � �������   � ����������������
�� .aevtoappnull  �   � ****�� 0 thewindowlist theWindowList�� 0 shouldclose shouldClose�� 0 
thiswindow 
thisWindow�� 0 
windowname 
windowName�� 0 theproplist thePropList�� 0 currentview currentView��   � �� ����� � ���
�� .aevtoappnull  �   � **** � k     � � �  ����  ��  ��   � ���� 0 i   �  ����������������������������� v���� � ����� �
�� 
cwin�� 0 thewindowlist theWindowList
�� 
cobj
�� 
nmbr�� 0 shouldclose shouldClose�� 0 
thiswindow 
thisWindow
�� 
pnam�� 0 
windowname 
windowName
�� 
pALL�� 0 theproplist thePropList
�� 
panl�� 0 currentview currentView��  ��  
�� .ascrcmnt****      � ****
�� 
pvew
�� 
bool
�� .coreclosnull���     obj �� �� �*�-E�O �k��-�,Ekh  fE�O��/E�O��,E�O��,EE�O ��,E�OeE�W X  ��%j O �a ,E�W X  �f  a �%j Y hO�a 	 �a & �j Oa �%j Y h[OY�}U � �� ���  �   � � � � � �  � �  �������
�� 
brow��T
�� kfrmID   �  � �  �������
�� 
brow���
�� kfrmID   �  � �  ������
�� 
brow��

� kfrmID   �  � �  ��~�}�|
�~ 
brow�}	�
�| kfrmID   �  � �  ��{�z�y
�{ 
brow�z	V
�y kfrmID  
�� boovfals � � � � � / U s e r s / j a m e s / P r o j e c t s / s c r i p t s / K e y b o a r d M a e s t r o A c t i o n s / C l o s e   A l l   F i n d e r   I n f o   P a n e l s � �x�w �
�x 
pcls
�w 
brow � �v�u �
�v 
ID  �u	V � �t � �
�t 
pnam � � � � � / U s e r s / j a m e s / P r o j e c t s / s c r i p t s / K e y b o a r d M a e s t r o A c t i o n s / C l o s e   A l l   F i n d e r   I n f o   P a n e l s � �s � �
�s 
posn � �r ��r  �  �q�p�q��p| � �o � �
�o 
pbnd � �n ��n  �  �m�l�k�j�m��l|�k$�jt � �i�h �
�i 
pidx�h  � �g�f �
�g 
pzum
�f boovfals � �e�d �
�e 
hclb
�d boovtrue � �c�b �
�c 
ptit
�b boovtrue � �a�` �
�a 
isfl
�` boovfals � �_�^ �
�_ 
pmod
�^ boovfals � �]�\ �
�] 
prsz
�\ boovtrue � �[�Z �
�[ 
iszm
�Z boovtrue � �Y�X �
�Y 
pvis
�X boovfals � �W�V �
�W 
wshd
�V boovtrue � �U � �
�U 
fvtg �  � �  ��T � �  ��S � �  ��R � �  ��Q � �  ��P � �  ��O � �  ��N
�N 
sdsk
�O 
cfol � � � � 
 U s e r s
�P 
cfol � � � � 
 j a m e s
�Q 
cfol � � � �  P r o j e c t s
�R 
cfol � � � �  s c r i p t s
�S 
cfol � � � � , K e y b o a r d M a e s t r o A c t i o n s
�T 
cfol � � � � 8 C l o s e   A l l   F i n d e r   I n f o   P a n e l s � �M�L �
�M 
pvew
�L ****lsvw � �K � �
�K 
icop �  � �  ��J �  ��I�H�G
�I 
brow�H	V
�G kfrmID  
�J 
icop � �F � �
�F 
lvop �  � �  ��E �  ��D�C�B
�D 
brow�C	V
�B kfrmID  
�E 
lvop � �A � �
�A 
cvop �  � �  ��@ �  ��?�>�=
�? 
brow�>	V
�= kfrmID  
�@ 
cvop � �<�; �
�< 
tbvi
�; boovtrue � �:�9 �
�: 
stvi
�9 boovtrue � �8�7�6
�8 
sbwi�7 ��6  
�� ****lsvw��  ascr  ��ޭ