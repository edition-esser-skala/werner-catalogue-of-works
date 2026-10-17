\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 e' fis
    g4. a8 h4
    r e,,8( h) fis'( h,)
    g'4. a8 h4~
    h8 a h c d!4
    e2.
    dis2 r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 h' h~
    h g' fis
    h,2.~
    h4 g fis
    e8 fis g4 fis
    e a c
    fis,2 r4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key e \minor \time 3/4 \autoBeamOff \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*7
  }
}

SopranoLyrics = \lyricmode {
  %tacet
}

Alto = {
  \relative c' {
    \clef alto
    \key e \minor \time 3/4 \autoBeamOff \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*7
  }
}

AltoLyrics = \lyricmode {
  %tacet
}

Tenore = {
  \relative c' {
    \clef tenor
    \key e \minor \time 3/4 \autoBeamOff \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*7
  }
}

TenoreLyrics = \lyricmode {
  %tacet
}

Basso = {
  \relative c {
    \clef bass
    \key e \minor \time 3/4 \autoBeamOff \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.
    r4 e^\solo fis
    g4. a8 h4
    e e, fis
    g4. a8 h4
    c8[ h a g fis e]
    h'4 h, a'
  }
}

BassoLyrics = \lyricmode {
  Ni -- si
  Do -- mi -- nus
  ae -- di -- fi --
  ca -- ve -- rit
  do --
  _ mum, in
}

Organo = {
  \relative c {
    \clef bass
    \key e \minor \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    e8-\solo fis g4 dis
    e2 dis4
    e8 fis g4 dis
    e2 dis4
    e2 d4
    c2.
    h2 a'4
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  r2 <6>4
  <5> <6>2
  <_+>2.
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
    \new FiguredBass { \BassFigures }
  >>
}
