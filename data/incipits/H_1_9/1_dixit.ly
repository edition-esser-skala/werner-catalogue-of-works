\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \dorian \time 4/4 \tempoMarkup "Andante"
    R1*5
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \dorian \time 4/4 \tempoMarkup "Andante"
    R1*5
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    r2 r4 d'~^\solo
    d8 cis16 h? cis[ h] cis8 d d r4
    r r8 c4 b16 a g8 f
    f16[ e] e8 r4 r8 c'4 h8
    c a g4 c, r
  }
}

SopranoLyrics = \lyricmode {
  Se --
  de a dex -- tris me -- is,
  se -- de a dex -- tris
  me -- is, do -- nec,
  do -- nec po -- nam,
}

Alto = {
  \relative c' {
    \clef alto
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    r2 r4 f~^\solo
    f8 e16 d e[ d] e8 f f r4
    r r8 f f16[ d] e[ f] d4
    e8 r r4 r2
  }
}

AltoLyrics = \lyricmode {
  Se -- tempoMarkup "Andante"
  de a dex -- tris me -- is,
  a dex -- tris me --
  is,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    a4.^\solo h16[ cis] d4. e16 f
    e4. f16 g f8 d r4
    r2 r4 r8 d~
    d c16 b a4 g g
    g r r8 d'4 cis8
  }
}

TenoreLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus
  Do -- mi -- no me -- o:
  Se --
  de a dex -- tris me --
  is, do -- nec,
}

Basso = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    r4 a'8^\solo a, d4. e16 f
    g4. a16 b a8 f r4
    R1
    r8 f4 e8 f d e4
  }
}

BassoLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus
  Do -- mi -- no me -- o:

  Do -- nec, do -- nec "po -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/4 \tempoMarkup "Andante"
    d8-\solo f cis a b16 b' a g f8 d
    g e a a, d f16 e d8 a
    b g c! c, f f' b,4
    c8 e f16 e d c h8 c g' g,
    c d b c a b g a
  }
}

BassFigures = \figuremode {
  r1
  <6 5 _->4 <_+>2.
  <6 5> <6>8 <5>
  <9 4> <6>4. <6 5>4 <4>8 <_!>
  r4 <6 5> <6> <6 5>8 <_+>
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
