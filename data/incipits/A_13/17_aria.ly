\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 4/4 \tempoMarkup "Largo"
    r4^\conSord r8 g'' e c r a
    fis16( e) fis8 r4 r8 \tuplet 3/2 8 { fis16 g a } g( e) fis8
    r2 r8 a16 h c d e8
    r2 r8 h16 cis d e fis8
    r2 r8 cis16 d e fis g8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 4/4 \tempoMarkup "Largo"
    r4^\conSord r8 e' c a r f
    dis16( cis) \hA dis8 r4 r8 \tuplet 3/2 8 { dis16 e fis } e8 \hA dis
    r2 r8 e a h
    r2 r8 d,16 e fis e d8
    r2 r8 ais'16 h cis8 d
  }
}

Soli = {
  \relative c' {
    \clef soprano
    \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    r8 h' g e r c' a f
    dis[ c'] h[ a] g fis r h
    gis h e,16[ \hA gis] h[ d] c[ h] c8 r h
    ais cis fis,16[ \hA ais] \hA cis[ e] d[ \hA cis] d8 r d
    c16[ h] c8 e h ais16[ gis] \hA ais8 r g
  }
}

SoliLyrics = \lyricmode {
  A Di -- o, a Di -- o
  mein Ge -- lieb -- ter, wan
  ich dein groſ -- ſen Schmer -- tzen in
  mein lieb -- vol -- len Her -- tzen recht
  in -- ner -- lich er -- we -- ge mit
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key e \minor \time 4/4 \tempoMarkup "Largo"
    e4\p r8 e a4 r8 a
    h4 dis, e8 h r h
    e4 gis a4. g8
    fis4 ais h h,
    e4. d!8 cis4. h8
  }
}

BassFigures = \figuremode {
  r2.. <6!>8
  <_+>4 <6>4. <_+>4 q8
  q2.. <6>8
  <_+>1
  <6!>4. <6>8 <6\\>4. <8 6>8
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Barmh."
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
