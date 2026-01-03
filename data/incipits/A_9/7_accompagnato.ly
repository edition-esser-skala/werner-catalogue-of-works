\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    \partial 2 es'2~\p^\markup \remark "stendato" es d~
    d es
    d4 f b,2~
    b as
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    \partial 2 c'2~\p^\markup \remark "stendato" c as~
    as g
    b g
    es2. f4~
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    \partial 2 g'2~\p^\markup \remark "stendato" g f~
    f es
    f es
    b c4 as'8 f
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    \partial 2 r4^\part "St: Petrus" g c8. c16 c8 es as,8. as16 as8 f
    d' d d16 d f es c4 r8 es
    b b d \hA b g g r b
    es es g \hA es c8. c16 c8 c
  }
}

SoliLyrics = \lyricmode {
  So kom -- me dann, em -- pfang den Lohn, du
  mein ge -- we -- ne -- dey -- ter Leib! Laß
  dich nun -- mehr be -- ſee -- len, man
  wird dir vor dein Her -- tzen -- leyd ein
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    \partial 2 c2~\p^\markup \remark "stendato" c c
    h! c
    d es
    g as~
  }
}

BassFigures = \figuremode {
  <_->1 <6- 4 2>2
  <7- 5> <_->
  <6->
  <6->2 <5>4 <6>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
      \new Staff {
        \set Staff.instrumentName = "vla"
        \Viola
      }
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
  \layout { }
}
