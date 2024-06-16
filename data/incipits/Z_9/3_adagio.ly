\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Adagio ma poco"
    r8 g''\f es( d) r g,\p es( d)
    r g\f es' c as4~ as16 f' d as
    g4 es' d2
    c b
    c8 as f es d4\fermata r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Adagio ma poco"
    r8 es'\f c( h) r es,\p c( h)
    r2 r8 as'\f f b
    b4 r8 c~ c16 c b a g( a) b8~
    b16 b as g f( g) as8~ as16 as g f es( f) g8~
    g f as c b,4\fermata r
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \tempoMarkup "Adagio ma poco"
    es4\f r8 g4 es8 r g~\p
    g es r as,\f f'2~
    f8 es g a!~ a fis d g~
    g e c f~ f d b es
    c4 as f\fermata r
  }
}

Cello = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Adagio ma poco"
    c4 r8 g' es c r g\p
    es c r4 r8 f'\f d' b
    es es, c' a! fis d b' g
    e c as' f d b g' es
    as2.\fermata r4
  }
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
      \new Staff {
        \set Staff.instrumentName = "vlc"
        \Cello
      }
    >>
  >>
}
