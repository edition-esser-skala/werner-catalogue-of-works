\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    a'1 g2 a
    a f'4 e d cis d2
    cis1 r2 c
    d2. d4 c2 b
    a b2. a4 b c
    a2 b b a
    b1 r2 a
  }
}

SopranoLyrics = \lyricmode {
  Ie -- ru -- sa --
  lem sur -- _ _ _ _
  ge et
  ex -- u -- e te
  ve -- _ sti -- bus iu --
  cun -- di -- ta -- _
  tis, "in -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    f1 e2. e4
    f2 a1 g2
    a1 r2 f
    f2. f4 a2 g
    fis g2. g4 g2
    f f4 f f1
    f r2 fis
  }
}

AltoLyrics = \lyricmode {
  Ie -- ru -- sa --
  lem sur -- _
  ge et
  ex -- u -- e te
  ve -- _ sti -- bus
  iu -- cun -- di -- ta --
  tis, "in -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    d1 b2 a
    a f1 b2
    e,1 r2 a
    b2. b4 a2 b
    d~ d2. d4 es es
    c2 d c1
    d r2 d
  }
}

TenoreLyrics = \lyricmode {
  Ie -- ru -- sa --
  lem sur -- _
  ge et
  ex -- u -- e te
  ve -- sti -- bus iu --
  cun -- di -- ta --
  tis, "in -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    d2 d1 cis2
    d1 b'
    a r2 f
    b2. b4 f2 g
    d g2. g4 es2
    f! b4 b f1
    b, r2 d
  }
}

BassoLyrics = \lyricmode {
  Ie -- ru -- sa --
  lem sur --
  ge et
  ex -- u -- e te
  ve -- _ sti -- bus
  iu -- cun -- di -- ta --
  tis, "in -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    d2 d1 cis2
    d d, b'1
    a r2 f'
    b2. b4 f2 g
    d g2. g4 es2
    f! b f1
    b, r2 d
  }
}

BassFigures = \figuremode {
  r2 <3> <4 2>1
  r <7>2 <6>
  r\breve
  r
  <_+>1. <6>2
  r1 <4>2 <3>
  r1. <_+>2
}

\score {
  <<
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
