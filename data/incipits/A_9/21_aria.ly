\version "2.24.2"
\include "header.ly"

sbTHOn = {
  \set subdivideBeams = ##t
  \set baseMoment = #(ly:make-moment 1/4)
  \set beatStructure = #'(2 2 2 2 2 2)
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key es \lydian \time 3/2 \tempoMarkup "Tempo ordinario"
    \sbTHOn r16 es\f es es es es es es g g g g b b b b es es es es g g g g
    f b,, b b b b b b d d d d f f f f b b b b as' as as as \gotoBar "9"
    es2 r r
    r16 b b b b b b b f' b, b b b b b b b' b, b b b c d b
    g'8 es b g es' b g es r b' es4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key es \lydian \time 3/2 \tempoMarkup "Tempo ordinario"
    \sbTHOn r16 es\f es es es es es es g g g g b b b b es es es es g g g g
    f b,, b b b b b b d d d d f f f f b b b b as' as as as \gotoBar "9"
    es2 r r
    r16 b b b b b b b f' b, b b b b b b b' b, b b b c d b
    es8 b g es g es b g r b' es4
  }
}

Soli = {
  \relative c {
    \clef bass
    \key es \lydian \time 3/2 \autoBeamOff \tempoMarkup "Tempo ordinario"
    R1.*2 \gotoBar "9"
    r4 es g r8 b es b g es
    b'4 f d b d' b
    g es r es g8 g b b
  }
}

SoliLyrics = \lyricmode {
  Auf auf, auf auf zum Zorn und
  Rach, ihr mei -- ne E -- le --
  men -- ten, nun rä -- chet je -- ne
}

Continuo = {
  \relative c {
    \clef bass
    \key es \lydian \time 3/2 \tempoMarkup "Tempo ordinario"
    es2 r4 es' g, es
    d2 r4 b' d, b \gotoBar "9"
    es2 r8 es g b es b g es
    d2 b d
    es r g
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  <6>
  r1 q2
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
        \set Staff.instrumentName = "Judex"
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
