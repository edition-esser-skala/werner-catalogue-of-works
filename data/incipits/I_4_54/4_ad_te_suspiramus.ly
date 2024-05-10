\version "2.24.2"
\include "header.ly"

psempre =
#(make-dynamic-script
  (markup #:null
          #:translate '(6.5 . 0)
          #:line (#:normal-text #:large #:bold "p"
                  #:normal-text #:small "sempre")))

Chalumeau = {
  \relative c' {
    \clef treble
    \key es \lydian \time 3/4 \tempoMarkup "Adagio e staccato"
    R2.*3 \gotoBar "22"
    g'2 r4
    R2.
    r4 b \afterGrace es( f8)
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key es \lydian \time 3/4 \tempoMarkup "Adagio e staccato"
    r8 es' es es es es
    r c c c c c
    r b b b es es \gotoBar "22"
    r es,\psempre es es es es
    r es es es es es
    r es es es es es
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key es \lydian \time 3/4 \tempoMarkup "Adagio e staccato"
    r8 b' b b b b
    r as as as as as
    r as as as g g \gotoBar "22"
    r g\psempre g g g g
    r g g g g g
    r g g g g g
  }
}

ViolaI = {
  \relative c' {
    \clef alto
    \key es \lydian \time 3/4 \tempoMarkup "Adagio e staccato"
    r8 es es es es es
    r es es es es es
    r es es es es es
    \gotoBar "22"
    r b\psempre b b b b
    r b b b b b
    r b b b b b
  }
}

ViolaII = {
  \relative c' {
    \clef tenor
    \key es \lydian \time 3/4 \tempoMarkup "Adagio e staccato"
    r8 g g g g g
    r as as as as as
    r b b b b b \gotoBar "22"
    r g\psempre g g g g
    r g g g g g
    r g g g g g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key es \lydian \time 3/4 \autoBeamOff \tempoMarkup "Adagio e staccato"
    R2.*3 \gotoBar "22"
    r4 es^\solo es
    es r r
    es\p r r
  }
}

SopranoLyrics = \lyricmode {
  Ad te
  su --
  "spi -"
}

Alto = {
  \relative c' {
    \clef alto
    \key es \lydian \time 3/4 \autoBeamOff \tempoMarkup "Adagio e staccato"
    R2.*3 \gotoBar "22"
    r4 b^\solo b
    b r r
    b\p r r
  }
}

AltoLyrics = \lyricmode {
  Ad te
  su --
  "spi -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key es \lydian \time 3/4 \autoBeamOff \tempoMarkup "Adagio e staccato"
    R2.*3 \gotoBar "22"
    r4 g^\solo g
    g r r
    g\p r r
  }
}

TenoreLyrics = \lyricmode {
  Ad te
  su --
  "spi -"
}

Basso = {
  \relative c {
    \clef bass
    \key es \lydian \time 3/4 \autoBeamOff \tempoMarkup "Adagio e staccato"
    R2.*3\gotoBar "22"
    r4 es^\solo es
    es r r
    es\p r r
  }
}

BassoLyrics = \lyricmode {
  Ad te
  su --
  "spi -"
}

Organo = {
  \relative c {
    \clef bass
    \key es \lydian \time 3/4 \tempoMarkup "Adagio e staccato"
    es8-\solo es es es es es
    r es es es es es
    r es es es es es \gotoBar "22"
    r es\psempre es es es es
    r es es es es es
    r es es es es es
  }
}

\score {
  <<
    \new Staff \with { \smallStaffDistance } {
      \set Staff.instrumentName = "chalumeau"
      \Chalumeau
    }
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
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
  >>
}
