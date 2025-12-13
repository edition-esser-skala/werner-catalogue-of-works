\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Andante"
    r2 fis8 d' c h
    a16 d8 h16 a4\trill g r
    r2 r8 h a d
    h a16 g a8 fis g4 r
    r8 d'~ d16 a' fis d h8 g r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Andante"
    r2 d8 h' a g
    fis g4 fis8 g4 r
    r2 r8 g fis d
    e4 fis8 d g4 r
    r8 h a8. fis16 d8 r r4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*2
    r2 g'16[^\solo a] h[ c] d8 e16[ fis]
    g8 fis16[ e] d[ c h c] h8 h16[ c] d8 e
    fis,8.\trill g16 a4 r8 h16[\p c] d8 e
  }
}

SopranoLyrics = \lyricmode {
  no -- stras de -- pre -- %3
  ca -- ti -- o -- nes ne, ne de --
  spi -- ci -- as, ne, ne "de -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1
    r2 h8^\solo e d g
    fis16.\trill e32 d8 r4 r2
    R1*2
  }
}

AltoLyrics = \lyricmode {
  San -- cta De -- i
  Ge -- ni -- trix,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*2
    fis,8^\solo a g c h16. a32 g8 r4
    R1*2
  }
}

TenoreLyrics = \lyricmode {
  San -- cta De -- i Ge -- ni -- trix,
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    g8^\solo g' fis e d4. d8
    d h16[ g] d'8. d16 g,4 r
    R1*3
  }
}

BassoLyrics = \lyricmode {
  Sub tu -- um prae -- si -- di --
  um con -- fu -- gi -- mus,
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Andante"
    g8-\solo g' fis e d2~
    d8 h16 g d4 g8 g' fis e
    d c h a g4 r
    r2 g'8 e h c
    d h fis d g e'\p h c
  }
}

BassFigures = \figuremode {
  r2 <5 _+>8 <8 6> <7 5> <6 4>
  <5 _+> r <4> <_+>4 <6>8 q <6\\>
  r <6> q <6\\> r2
  r r8 <5> <6>4
  r2 r8 <5>8 <6>4
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
