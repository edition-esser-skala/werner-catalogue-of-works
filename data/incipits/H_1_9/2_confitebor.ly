\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/2 \tempoMarkup "Andante"
    R1.*5
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/2 \tempoMarkup "Andante"
    R1.*5
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    b'1^\solo c4 d
    c b a g f es
    d2. es4 f g8[ a]
    b2. c4 d es
    f d b2 d
  }
}

SopranoLyrics = \lyricmode {
  Con -- fi -- _
  te -- bor ti -- _ bi, _
  Do -- mi -- ne, in
  to -- to cor -- de
  me -- o, in "con -"
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.*5
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.*5
  }
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.*5
  }
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 3/2 \tempoMarkup "Andante"
    b'2-\solo g d
    es f a,
    b b' a
    g4 g, g'2 f4 es
    d1 b2
  }
}

BassFigures = \figuremode {
  r1 <6>2
  q1.
  r
  r
  <6>
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
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
