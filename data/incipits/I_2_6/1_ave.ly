\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
    R1*4
    r2 c'8. d16 e8 c
    f c4 a8 a,4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
    R1*4
    f8. g16 a8 f c' g4 e8
    c4 r r8 e' cis a
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r8 d'^\solo f e d4 d8 c
    b4 a r8 g4 f8
    b8. b16 a4 r8 g4 f8
    f([ e] d4) e r
    R1*2
  }
}

SopranoLyrics = \lyricmode {
  A -- ve Re -- gi -- na coe --
  lo -- rum, a -- ve
  Do -- mi -- na An -- ge --
  lo -- rum.
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 r8 f^\solo a g
    f4 f8 e d4 c
    r8 d[ e] f d8. d16 c4
    h8 c c[ h] c4 r
    R1*2
  }
}

AltoLyrics = \lyricmode {
  A -- ve Re --
  gi -- na coe -- lo -- rum,
  a -- ve Do -- mi -- na
  An -- ge -- lo -- rum.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 r8 d^\solo f e
    d4 d8 c b4 a
    r8 g4 f8 b8. b16 a4
    g8 g g4 g r
    R1*2
  }
}

TenoreLyrics = \lyricmode {
  A -- ve Re --
  gi -- na coe -- lo -- rum,
  a -- ve Do -- mi -- na
  An -- ge -- lo -- rum.
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1*3
    r2 c8.[^\solo d16] e8 c
    f c f a g4 c,
    r8 a'4 f8 cis cis cis16[ d] e[ cis]
  }
}

BassoLyrics = \lyricmode {
  Sal -- _ ve
  ra -- dix, sal -- ve por -- ta
  ex qua mun -- do lux est
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
    d4-\solo r r8 \clef tenor d' f e
    d4. c8 b4 a
    r8 g4 f8 b4 a
    g2 \clef bass c,4 c'
    a f e c
    a f cis' a
  }
}

BassFigures = \figuremode {
  r2. <6>8 q
  <6->4 <5> <7>8 <6> <7> <6>
  r <3> <2>4 <7>8 <6> <7> <6>
  <7 _!> <6 4> <5 \t> <\t _!> r2
  r1
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
