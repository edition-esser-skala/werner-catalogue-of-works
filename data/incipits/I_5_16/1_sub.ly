\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/2 \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
    a'1 a2 b~
    b a g2. g4
    fis1 r2 b
    d b f'! f
    d e! f f,
    c' d c2. c4
    c1 r
    r c2. c4
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key f \major \time 4/2 \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
    f1 f2 f~
    f f d2. d4
    d1. g2
    f!2. f4 f2 a
    b2. b4 a2 a
    f f e2. e4
    f1 r2 f~
    f4 f d2 g es
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/2 \tempoMarkup "Allabreve" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    a'1 a2 b~
    b a g2. g4
    fis1 r2 b
    d b f'! f
    d e!4 e f2 f,
    c' d c2. c4
    c1 r
    r c2. c4
  }
}

SopranoLyrics = \lyricmode {
  Sub tu -- um __
  prae -- si -- di --
  um con --
  fu -- gi -- mus, con --
  fu -- gi -- mus, San -- cta
  De -- i Ge -- ni --
  trix,
  no -- stras
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/2 \tempoMarkup "Allabreve" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    f1 f2 f~
    f f d2. d4
    d1. g2
    f!2. f4 f2 a
    b2. b4 a2 a4 a
    f2 f e2. e4
    f1 r2 f~
    f4 f d2 g es
  }
}

AltoLyrics = \lyricmode {
  Sub tu -- um __
  prae -- si -- di --
  um con --
  fu -- gi -- mus, con --
  fu -- gi -- mus, San -- cta
  De -- i Ge -- ni --
  trix, no --
  stras de -- pre -- "ca -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/2 \tempoMarkup "Allabreve" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    c1 c2 d~
    d c b2. b4
    a2 d b es
    d d1 c2
    b2. b4 c2 d
    c b4 a g2. g4
    a2 c4 c a2 d
    b1 g
  }
}

TenoreLyrics = \lyricmode {
  Sub tu -- um __
  prae -- si -- di --
  um con -- fu -- gi --
  mus, San -- cta
  De -- i, San -- cta
  De -- i __ _ Ge -- ni --
  trix, de -- pre -- ca -- ti --
  o -- nes,
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/2 \tempoMarkup "Allabreve" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    f1 f2 b,~
    b f' g2. g4
    d2 d g es
    b'1. f2
    g2. g4 f2 d4 d
    a2 b c2. c4
    f,2 r f'2. f4
    d2 g es c
  }
}

BassoLyrics = \lyricmode {
  Sub tu -- um __
  prae -- si -- di --
  um con -- fu -- gi --
  mus, con --
  fu -- gi -- mus, San -- cta
  De -- i Ge -- ni --
  trix, no -- stras
  de -- pre -- ca -- "ti -"
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/2 \tempoMarkup "Allabreve"
      \set Staff.timeSignatureFraction = 2/2
    f1 f2 b,~
    b f' g2. g4
    d1 g2 es
    b'1. f2
    g1 f2 d
    a b c1
    f, f'
    d2 g es c
  }
}

BassFigures = \figuremode {
  r\breve
  r
  <_+>1. <5>2
  r\breve
  <5>2 <6>1.
  <6>\breve
  r1 <3>2 <6>
  q1 q
}

\score {
  <<
    \new StaffGroup <<
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
    \new FiguredBass { \BassFigures }
  >>
}
