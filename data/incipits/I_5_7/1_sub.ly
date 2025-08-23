\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/2 \tempoMarkup "Allabreve moderato"
      \set Staff.timeSignatureFraction = 2/2
    fis8\pp d' g, d' a d h d a d h d a d g, d'
    fis, e d g fis a h cis d fis h, d a d g, d'
    fis, a d fis a a, fis' a, e' a fis a e a d, a'
    cis, a fis a e a d, a' cis, a cis e a d g, d'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/2 \tempoMarkup "Allabreve moderato"
      \set Staff.timeSignatureFraction = 2/2
    fis8\pp d' g, d' a d h d a d h d a d g, d'
    fis, e d g fis a h cis d fis h, d a d g, d'
    fis, a d fis a a, fis' a, e' a fis a e a d, a'
    cis, a fis a e a d, a' cis, a cis e a d g, d'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/2 \autoBeamOff \tempoMarkup "Allabreve moderato"
      \set Staff.timeSignatureFraction = 2/2
    d1 d
    d2 d d d
    d fis a a
    a1 a2 a
  }
}

SopranoLyrics = \lyricmode {
  Sub tu --
  um prae -- si -- di --
  um con -- fu -- gi --
  mus, San -- cta
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/2 \autoBeamOff \tempoMarkup "Allabreve moderato"
      \set Staff.timeSignatureFraction = 2/2
    d1 d
    d2 d d d
    d fis a a
    a1 a2 a
  }
}

AltoLyrics = \lyricmode {
  Sub tu --
  um prae -- si -- di --
  um con -- fu -- gi --
  mus, San -- cta
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 2/2 \autoBeamOff \tempoMarkup "Allabreve moderato"
    R\breve*4
  }
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 2/2 \autoBeamOff \tempoMarkup "Allabreve moderato"
    R\breve*4
  }
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/2 \tempoMarkup "Allabreve moderato"
      \set Staff.timeSignatureFraction = 2/2
    d4-\solo e fis g fis g fis e
    d h'a g fis g fis e
    d fis e d cis d cis h
    a d cis h a g' fis e
  }
}

BassFigures = \figuremode {
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
