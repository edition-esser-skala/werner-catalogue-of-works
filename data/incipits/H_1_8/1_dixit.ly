\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]"
    e'4. e8 e a gis4
    r8 e a16 h a g f g a f d8 e16 f
    g4 g r8 g h g
    g4. g8 g g c, a'
    g g16 g g8 g g g f16 g f g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]"
    c'4 h c e~
    e16 f e d c4 d4. c8
    d4 e8 e d e h8. c16
    d8 e h8. c16 d8 e f f
    e4 d8 h4 cis8 d8. d16
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    a'8^\solo e h' c16 d c8 h16 a h8 e,
    e' c16 h a8 a f' d16 c h8 c
    c[ h] c e^\tutti d e h8. c16
    d8 e h8.[ c16] d8 e f f
    e4\trill d8 h4 cis8 d8. d16
  }
}

SopranoLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus Do -- mi -- no me -- o:
  Se -- de a dex -- tris, se -- de a dex -- tris
  me -- is. Te -- cum prin -- ci -- pi --
  um in di -- e vir -- tu -- tis
  tu -- ae in splen -- do -- "ri -"
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1
    r2 r4 d8^\solo e16 f
    g8 d e c r g'^\tutti g g
    g4. g8 g g a4
    g8 g16 g g8 g g g16 g f[ g f g]
  }
}

AltoLyrics = \lyricmode {
  Vir -- gam vir --
  tu -- tis tu -- ae e -- mit -- tet
  Do -- mi -- nus ex Sy --
  on: Do -- mi -- na -- re in -- i -- mi -- "co -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1
    g!8^\solo g a a a8. a16 g8 g
    g4 g r8 e'^\tutti d e
    d c d h g c16 c c8 c
    c4 h8 d d e a, a
  }
}

TenoreLyrics = \lyricmode {
  Do -- nec po -- nam in -- i -- mi -- cos
  tu -- os. Iu -- ra -- vit
  Do -- mi -- nus et non poe -- ni -- te -- bit
  e -- um: Tu es sa -- cer -- dos
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1
    r8 c^\solo f16[ g] f[ e] d[ e f d] g8 c,
    g4 c8 c'^\tutti h c g8. a16
    h8 c g8.[ a16] h8 c a f
    c16[ d e f] g8 g4 e8 d8. d16
  }
}

BassoLyrics = \lyricmode {
  Sca -- bel -- lum pe -- dum tu --
  o -- rum. Te -- cum prin -- ci -- pi --
  um in di -- e vir -- tu -- tis
  tu -- ae in splen -- do -- "ri -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]"
    a'4-\solo gis a e
    c f d g8 c,
    g4 c8 c'-\tutti h c g8. a16
    h8 c g8. a16 h8 c a f
    c' c, g'4. e8 d4
  }
}

BassFigures = \figuremode {
  r2. <_+>4
  <5!>1
  r
  r
  r2 r8 <6\\>4.
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
