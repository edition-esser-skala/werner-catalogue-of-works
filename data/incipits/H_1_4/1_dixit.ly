\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
    a''8 g f b a f b a
    a4 g8 f16 g a8 a g4
    a r r2
    R1*2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
    d'4. d8 cis d4 \hA cis8
    d4 r c8 f f e
    f4 r r2
    R1*2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    d'8^\tutti d d d16 d cis8 d16 d d8[ cis]
    d4 r c8^\solo f f e
    f16 e f c d4 c8 d b c
    a16[ h] c c c8[ h] c4 r
    r8 g a c f f r e16 e
  }
}

SopranoLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus Do -- mi -- no me --
  o: do -- nec po -- nam
  in -- i -- mi -- cos tu -- os, sca -- bel -- lum
  pe -- dum tu -- o -- rum.
  Tu es sa -- cer -- dos in "ae -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    f8^\tutti g a b16 b a8 f16 f b8[ a]
    a4 g8 f16 g a8 a g4
    a r r r8 g^\solo
    f g16[ a] d,8. d16 e8 g a g16 f
    g8 e f16 f a a f f d d g8 g16 g
  }
}

AltoLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus Do -- mi -- no me --
  o: Se -- de a dex -- tris me --
  is, Te --
  cum prin -- ci -- pi -- um in di -- e vir --
  tu -- tis tu -- ae in splen -- do -- ri -- bus san -- cto -- rum, ex
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r4 a8^\tutti g16[ f] e8 d e8. e16
    f4 c'!4. d16 d d8[ c]
    c4 r r2
    r r8 c^\solo c f
    e16 d c8 c c d4. e8
  }
}

TenoreLyrics = \lyricmode {
  Di -- xit, di -- xit Do -- mi --
  nus Do -- mi -- no me --
  o:
  Iu -- ra -- vit
  Do -- mi -- nus et non poe -- "ni -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    d8^\tutti e f g16 g a8 b16 b g8[ a]
    d,4 e8 d16 c! f8 d b[ c]
    f,4 r8 b'^\solo a f g e
    f e16 f g8 g, c16 d e c f4
    c8 c'16 c a8 f16 f d d b' b g8 e
  }
}

BassoLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus Do -- mi -- no me --
  o: Se -- de a dex -- tris me --
  is, Vir -- gam vir -- tu -- tis
  tu -- ae e -- mit -- tet Do -- mi -- nus ex Si --
  on: Do -- mi -- na -- re in me -- di -- o in -- i -- "mi -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
    d8-\tutti e f g a b g a
    d, f e d16 c! f8 d b c
    f a, b-\solo b' a f g e
    f e16 f g8 g, c e f f,
    c' c' a f d b' g e
  }
}

BassFigures = \figuremode {
  r2 <_+>4 <6 5>8 <_+>
  r4 <6>2 <6 5>4
  r2. <_->8 <6 5>
  r r <4> <_!> r2
  r1
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
