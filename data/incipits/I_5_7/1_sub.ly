\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 2/2 \tempoMarkup "Allabreve moderato"
    fis8\pp d' g, d' a d h d
    a d h d a d g, d'
    fis, e d g fis a h cis
    d fis h, d a d g, d'
    fis, a d fis a a, fis' a,
    e' a fis a e a d, a'
    cis, a fis a e a d, a'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 2/2 \tempoMarkup "Allabreve moderato"
    fis8\pp d' g, d' a d h d
    a d h d a d g, d'
    fis, e d g fis a h cis
    d fis h, d a d g, d'
    fis, a d fis a a, fis' a,
    e' a fis a e a d, a'
    cis, a fis a e a d, a'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 2/2 \autoBeamOff \tempoMarkup "Allabreve moderato"
    d1^\solo
    d
    d2 d
    d d
    d fis
    a a
    a1
  }
}

SopranoLyrics = \lyricmode {
  Sub
  tu --
  um prae --
  si -- di --
  um con --
  fu -- gi --
  mus,
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 2/2 \autoBeamOff \tempoMarkup "Allabreve moderato"
    d1^\solo
    d
    d2 d
    d d
    d fis
    a a
    a1
  }
}

AltoLyrics = \lyricmode {
  Sub
  tu --
  um prae --
  si -- di --
  um con --
  fu -- gi --
  mus,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 2/2 \autoBeamOff \tempoMarkup "Allabreve moderato"
    R1*7
  }
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 2/2 \autoBeamOff \tempoMarkup "Allabreve moderato"
    R1*7
  }
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 2/2 \tempoMarkup "Allabreve moderato"
    \mvTr d4\p-\solo e fis g
    fis g fis e
    d h'a g
    fis g fis e
    d fis e d
    cis d cis h
    a << { d'^\markup \remark "vlne" cis h a } \\ { d,_\org cis h a } >>
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r
  r
  r
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
