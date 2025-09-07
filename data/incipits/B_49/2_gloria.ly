\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Andante"
    R1*2
    r2 r4 r8 d'
    e4. c16 e f4. d16 f
    g4. e16 g a8 f, r4
    R1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Andante"
    R1*3
    r8 g' a4. f16 a b4~
    b8 g16 b c8 c, r2
    R1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    r2 r4 r8 a'^\solo
    b16[ c] d4 c16[ b] a4 r
    R1*2
    r4 c4. a16 b c8 d16 b
  }
}

SopranoLyrics = \lyricmode {
  Lau --
  da -- _ mus te,

  Gra -- ti -- as a -- gi -- mus
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    r4 a'8^\solo g fis g g[ \hA fis]
    g4 r8 g4 f16[ e] d8 e16 f
    e4 r8 e4 d16[ c] b8 a
    g g' g g g[ f16 e] f4~
    f8[ e16 d] e8. f16 f4 r
  }
}

AltoLyrics = \lyricmode {
  bo -- nae vo -- lun -- ta -- %2
  tis. be -- ne -- di -- ci -- mus
  te, ad -- o -- ra -- mus
  te, glo -- ri -- fi -- ca -- _
  _ mus te.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    d8^\solo a f' e d c b8. b16
    a8 e'4 e8 d16[ c] b8 a[ d]
    d4 r r r8 d~
    d c16[ b] a8 g f4 r8 f'~
    f e16[ d] c8 b a b c d
    g,4. g8 a4 r
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra pax ho -- mi -- ni --
  bus bo -- nae vo -- lun -- ta --
  tis. ad --
  o -- ra -- mus te, ad --
  o -- ra -- mus te, glo -- ri -- fi --
  ca -- mus te.
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    r4 d8^\solo a f' e d8. d16
    cis4 r8 \hA cis d g d8. d16
    g,4 r r r8 b
    c4. c8 d4 d8 d
    e4. e8 f[ d a b]
    c4. c8 f4 r
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra, ter -- ra
  pax, pax, pax ho -- mi -- ni --
  bus glo --
  ri -- fi -- ca -- mus, glo --
  ri -- fi -- ca --
  _ mus te.
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Andante"
    d4.-\solo a8 f' e d4
    cis r8 \hA cis d g d4
    g8 f! e4 f b,
    c2 d
    e f8 d a b
    c4 c, f4. b8
  }
}

BassFigures = \figuremode {
  r2 <6>8 q r4
  r2 <_+>8 <_-> <4> <_+>
  r <6> <7> <6> <9> <8>4.
  <9 5>4 <8 6> <9 5> <8 6>
  <9 5-> <8 6> <9>8 <6> q4
  <4> <3>2.
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
