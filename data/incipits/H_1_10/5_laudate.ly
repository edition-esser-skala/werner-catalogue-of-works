\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Andante"
    R1*6
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Andante"
    R1*6
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    r8 c'^\solo f c16[ b] a8. b16 c4
    d8 d c8.[ b16] a8 c f4~
    f8 e16[ d] c8 b a d h8. h16
    c8 r r4 r2
    R1*2
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da -- te Do -- mi -- num,
  o -- mnes gen -- tes, lau -- da --
  te e -- um, o -- mnes po -- pu --
  li.
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*2
    r2 r4 d8^\solo e16 f
    g8 f e f16[ g] c,4 f8 es
    d e16 f b,8. b16 a4 r8 f'~
    f e f a f d e d16 e
  }
}

AltoLyrics = \lyricmode {
  Quo -- ni -- am %3
  con -- fir -- ma -- ta est, con -- fir --
  ma -- ta est su -- per nos, su --
  per nos mi -- se -- ri -- cor -- di -- a
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*3
    g8^\solo a16 h c8 b a b16[ c] f,8 g16[ a]
    b8 r r4 r8 c4 h8
    c4 r r2
  }
}

TenoreLyrics = \lyricmode {
  Quo -- ni -- am con -- fir -- ma -- ta su -- per %4
  nos, su -- per
  nos
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*3
    r4 c8^\solo d16 e f8 es d \hA es16[ f]
    b,8 f'4 e8 f e d8. d16
    c8 c' a f b a16 b g4
  }
}

BassoLyrics = \lyricmode {
  Quo -- ni -- am con -- fir -- ma -- ta
  est su -- per nos, est su -- per
  nos mi -- se -- ri -- cor -- di -- a "e -"
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Andante"
    f,8 f' a e f d a f'
    b g e c f e d a
    b g' e g f d g f
    e d c d16 e f8 es d c
    b a g c f e d4
    c8 c' a f b a16 b g4
  }
}

BassFigures = \figuremode {
  r1
  r4 <6>2.
  r4 <6>8 <_->4. <_!>4
  <6>8 <6!>2..
  r4 <7>8 <7 _!>4 r8 <7> <6!>
  <4> <3> r2 <6>8 <5>
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
