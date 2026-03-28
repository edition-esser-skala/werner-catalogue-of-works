\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo, Adagio"
    R1
    r8 as''(\p f) c( a4) r
    r32 b\f c d es f g a b16 g d b r2
    r32 d'\f c b a g f es d \hA b' a g f \hA es d c b4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo, Adagio"
    R1
    r8 f'(\p c) as( fis4) r
    r32 g\f a b c d es f g16 d b g r2
    r32 b'\f a g f es d c b d c \hA b a g f es d4 r
  }
}

Soli = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo, Adagio"
    r8^\markup \remark "lamentabile" ^\markup \remark "Debora" c g'8. g16 g8 b des c
    as as r f es8. c16 \hA es8 d!
    b4 r8 g' f16 a c a f8 a
    d, d r4 r8 f b16 b d \hA b
  }
}

SoliLyrics = \lyricmode {
  Ô Herr! in deſ -- ſen Wun -- der --
  güt -- te kein Grund zu for -- ſchen
  iſt, be -- feu -- re dei -- nes Volks Ge --
  mü -- the, daß ſich durch dein "Ge -"
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo, Adagio"
    e!1
    f2 fis
    g a
    b b,
  }
}

BassFigures = \figuremode {
  <6>1
  <_->2 <7- 5>
  <_-> <6>
  r1
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
