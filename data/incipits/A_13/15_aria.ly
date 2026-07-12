\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 3/4 \tempoMarkup "Largo"
    \after 4*0 -\markup \remark "sempre pizz." R2.*2
    r4 r8 d' h g
    es c d4 r
    R2.*2
    r8 b'! g' es f d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 3/4 \tempoMarkup "Largo"
    \after 4*0 -\markup \remark "sempre pizz." R2.*2
    r4 r8 h d \hA h
    c es h4 r
    R2.*2
    r8 g' b! g as f
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 3/4 \autoBeamOff \tempoMarkup "Largo"
    g4 \tuplet 3/2 { es'8[ d c] } h[ d]
    c[ b16 as] g4 f
    es\trill d r
    R2.
    b'4 \tuplet 3/2 { c8[ d es] } b4
    f'8[ es d c] b[ as]
    \appoggiatura as4 g2 r4
  }
}

SoliLyrics = \lyricmode {
  Hin -- weg mit
  al -- _ len
  Freu -- den

  ſo mir die
  Welt __ vor --
  zeigt,
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \dorian \time 3/4 \tempoMarkup "Largo"
    c2\p d4
    es h g
    c g r
    c^\pizz g r
    es'2 es4
    d b' d,
    es2 b4
  }
}

BassFigures = \figuremode {
  r2 <6!>4
  <6>2.
  r4 <_!>2
  r4 q2
  <5 3>4 <6 4-> <5 3>
  <6>2.
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
        \set Staff.instrumentName = "Adam"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
