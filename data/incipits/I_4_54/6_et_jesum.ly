\version "2.24.2"
\include "header.ly"

Chalumeau = {
  \relative c' {
    \clef treble
    \key es \lydian \time 3/4 \tempoMarkup "Largo"
    b'2\p es4~
    es2.~
    es~
    es~
    es2 b4
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key es \lydian \time 3/4 \tempoMarkup "Largo"
    g'4\p g g
    as as as
    g( f) es
    f( es) d
    es g f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key es \lydian \time 3/4 \tempoMarkup "Largo"
    es4\p es es
    c c c
    b b b
    as as as
    g4. a8 b4
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key es \lydian \time 3/4 \autoBeamOff \tempoMarkup "Largo"
    r4 \mvTr b2\p^\solo
    c4.( d8) es([ c)]
    b4( as) g
    as( g) f
    g4.( a8) b4
  }
}

TenoreLyrics = \lyricmode {
  Et
  Je -- sum,
  be -- ne --
  di -- ctum
  fru -- ctum
}

Organo = {
  \relative c {
    \clef bass
    \key es \lydian \time 3/4 \tempoMarkup "Largo"
    \mvTr es4\p-\solo es es
    es es es
    es es es
    es es es
    es es d
  }
}

\score {
  <<
    \new Staff \with { \smallGroupDistance } {
      \set Staff.instrumentName = "chal"
      \Chalumeau
    }
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
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
  >>
}
