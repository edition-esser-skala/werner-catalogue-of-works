\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key es \lydian \time 12/8 \tempoMarkup "Allegro"
    es16\f d es f g as b8 b, r es'16 d es f g a b8 b, r \gotoBar "6"
    c as b es, es'16 d c b as8 f b g16 b es b g'8
    r b\p g r g es r b g r g\f es
    f( a!) b a( c) a b16 f d' b f' d b'8 b, r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key es \lydian \time 12/8 \tempoMarkup "Allegro"
    es16\f d es f g as b8 b, r es'16 d es f g a b8 b, r \gotoBar "6"
    c as b es, es'16 d c b as8 f b es,16 g b g es'8
    r g\p es r es b r b g r g\f es
    f( a!) b a( c) a b16 f d' b f' d b'8 b, r
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \key es \lydian \time 12/8 \autoBeamOff \tempoMarkup "Allegro"
    R1. \gotoBar "6"
    r2*3/2 r4 r8 r4 b8
    es b g' es b es b g b g es r
    r2*3/2 r4 r8 r4 b'8
  }
}

SoliLyrics = \lyricmode {
  Er --
  zütt -- re, er -- ta -- tre, er -- blaſ -- ſe Ver -- weg -- ner!
  "Er -"
}

Continuo = {
  \relative c {
    \clef bass
    \key es \lydian \time 12/8 \tempoMarkup "Allegro"
    es8\f es' es d, d' d c, c' c b, b' b \gotoBar "6"
    as4 b8 es, es'16 d c b as8 f b es, b g
    es4 r8 es'4 r8 es4 r8 es4 r8
    d4 r8 c4 r8 b4 r8 b' d b
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  <6>4. <6! _-> r2.
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
        \set Staff.instrumentName = "Sisera"
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
  % \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
