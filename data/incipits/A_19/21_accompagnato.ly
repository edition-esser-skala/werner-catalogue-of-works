\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    R1*2
    r2 \tempoMarkup "Adagio" r8 c'16\pp des des8 e!16( f)
    f4 r a!16(\pocoF b) ges( e!) f( des) a!( b)
    f8 r as' r r32 g,\f a! h! c d es f g16-! d-! h-! g-!
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    R1*2
    r2 \tempoMarkup "Adagio" r8 as'\pp b g16( a)
    a4 r a'!16(\pocoF b) ges( e!) f( des) a!( b)
    f8 r f' r r32 g,\f a! h! c d es f g16-! d-! h-! g-!
  }
}

Soli = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    es'8^\markup \remark "ardito"^\markup \remark "Jahel" b r16 des f es c8. c16 c4
    r8 c, e! f g8. g16 g8 as
    b b des c \tempoMarkup "Adagio" as4 r
    \clef tenor r8^\markup \remark "lamentabile" ^\markup \remark "Sisera" c, es a,! b4 r
    r8 f'\pocoF r16 f d! b g4 r8 g
  }
}

SoliLyrics = \lyricmode {
  Ster -- be! ver -- ruch -- ter Hoch -- mueths -- geiſt!
  weil Gott der Hel -- den Herr dich
  al -- ſo ſter -- ben heiſt.
  Ô weh! ô weh!
  waß? ach waß ge -- ſchicht? wer
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    g2 as4. c8
    e,!2 e'~
    e \tempoMarkup "Adagio" f4\pp r
    f r des r
    d r h! r
  }
}

BassFigures = \figuremode {
  <6->1
  <6>
  <5->2 <_->
  <_!> <6>
  q <6>
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
        \set Staff.instrumentName = "soli"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
