\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key h \minor \time 4/4 \tempoMarkup "Andante"
    R1*5
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key h \minor \time 4/4 \tempoMarkup "Andante"
    R1*5
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key h \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    h'4.^\solo cis16 d cis8 d e d16[ cis]
    d8 cis h4 r e8 d
    cis4 cis r8 a d cis
    h4 e8 d cis a d e16 h
    cis2\trill d4 r
  }
}

SopranoLyrics = \lyricmode {
  Cre -- di -- di, pro -- pter quod lo --
  cu -- tus sum, e -- go
  au -- tem hu -- mi -- li --
  a -- tus, hu -- mi -- li -- a -- tus sum
  ni -- mis.
}

Alto = {
  \relative c' {
    \clef alto
    \key h \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*4
    a'4.^\solo g8 fis g16[ a] h8 g
  }
}

AltoLyrics = \lyricmode {
  E -- go di -- xi in "ex -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key h \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*5
  }
}

Basso = {
  \relative c {
    \clef bass
    \key h \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*5
  }
}

Organo = {
  \relative c {
    \clef bass
    \key h \minor \time 4/4 \tempoMarkup "Andante"
    h4-\solo h' ais8 h gis ais
    h4. a8 g2
    r4 a8 g fis2
    g8 fis e g a4 fis8 g
    a g a a, d4 g
  }
}

BassFigures = \figuremode {
  r2. <6>8 q
  r2 q
  r q
  r1
  <4>4 <3>2.
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
      \new Lyrics \lyricsto Alto \AltoLyrics

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
