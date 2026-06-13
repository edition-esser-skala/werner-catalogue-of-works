\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Tempo ordinario"
    r4 a' d r
    r8 cis d e f8. f16 e4
    r8 d c a b4 a8 a~
    a g g a16 g f8. e16 f4
    r r8 e' e d f e16 d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Tempo ordinario"
    r2 r4 d
    a' r r8 f g a
    b8. b16 a8 a g e f4
    e r8 e e d d e16 d
    cis8. h16 \hA cis8 cis f4 f8 f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    r4 a'^\tutti d r
    r8 cis d e f8. f16 e4
    r8 d c a b4 a8 a~
    a g16 g g8 a16[ g] f8.[ e16] f4
    r r8 e' e d f e16[ d]
  }
}

SopranoLyrics = \lyricmode {
  Ad te
  le -- va -- vi a -- ni -- mam,
  a -- ni -- mam me -- am, De --
  us in te con -- fi -- do,
  De -- us in te "con -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    r2 r4 d^\tutti
    a' r r8 f g a
    b8. b16 a8 a g e f4
    e r8 e e d d e16[ d]
    cis8.[ h16] \hA cis8 cis f4 f8 f
  }
}

AltoLyrics = \lyricmode {
  Ad
  te le -- va -- vi
  a -- ni -- mam, a -- ni -- mam me --
  am, De -- us in te con --
  fi -- do, con -- fi -- do, ad
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    R1*4
    r4 a^\tutti d r
  }
}

TenoreLyrics = \lyricmode {
  Ad te
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    R1*4
    r2 r4 d^\tutti
  }
}

BassoLyrics = \lyricmode {
  Ad
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Tempo ordinario"
    d8-\tutti e f g f e f d
    cis a h \hA cis d4 e8 f
    g4 a8 d b c d b
    c4 c,8 cis d2
    a' d4 d,
  }
}

BassFigures = \figuremode {
  r1
  r
  r4 <_!> <6>4. <7>8
  <6> <5>4 <6>8 <9> <8>4.
  <_+>2 <9>8 <8>4.
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
