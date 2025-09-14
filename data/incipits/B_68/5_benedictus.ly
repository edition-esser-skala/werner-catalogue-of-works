\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.
    fis'-\solo
    h,4 g'8 fis e4
    d8 g c,2\trill
    h r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    h'2.-\solo
    a4 h fis
    g8 a h4 c
    g2 fis4
    g2 r4
  }
}

Basso = {
  \relative c {
    \clef bass
    \key e \minor \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 e^\solo e
    fis h, h'8[ a]
    g[ fis] e d c!4
    h8 h a4. a8
    g4 g' g
  }
}

BassoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit in no --
  mi -- ne Do -- mi --
  ni, be -- "ne -"
}

Organo = {
  \relative c {
    \clef bass
    \key e \minor \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    e2.~-\solo
    e4 dis8 cis \hA dis4
    e4. d8 c4
    h a2
    g4 g'2
  }
}

BassFigures = \figuremode {
  r2.
  <4 2>4 <6>2
  r2.
  <6>4 <7> <6>
  r2.
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
    \new FiguredBass { \BassFigures }
  >>
}
