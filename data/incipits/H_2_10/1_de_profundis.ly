\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Larghetto"
    R1*2
    r2 r8 c'\f c c
    a'4. a8 f8. f16 f8 f
    d4 g4. g8 g4
    g r e2~\p
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Larghetto"
    R1*3
    r8 f\f f f d'8. d16 d8 d
    d d c e d2
    e4 r g,2\p
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "Larghetto" \autoBeamOff
    R1
    a'4.^\solo a8 a[ g] g d'
    e e f f f4 e\trill
    f r d8.^\tutti d16 d8 d
    d d c e d2
    e8 e,4^\solo f8 g g g a
  }
}

SopranoLyrics = \lyricmode {
  De pro -- fun -- dis cla -- %2
  ma -- vi ad te, Do -- mi --
  ne: Do -- mi -- ne, ex --
  au -- di vo -- cem me --
  am. Fi -- ant au -- res tu -- ae
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Larghetto" \autoBeamOff
    r2 e4.^\solo e8
    e[ d] d a' b4. b8
    g4 a g4. g8
    a4 r f8.^\tutti f16 f8 f
    d d g g g2
    g4 r r2
  }
}

AltoLyrics = \lyricmode {
  De pro --
  fun -- dis cla -- ma -- vi
  ad te, Do -- mi --
  ne: Do -- mi -- ne, ex --
  au -- di vo -- cem me --
  am.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "Larghetto" \autoBeamOff
    d4.^\solo d8 d[ cis] cis a
    f'4 d r8 b d d
    c! c c2 c4
    c r b8.^\tutti b16 b8 b
    h h c4. c8 h4
    c r r2
  }
}

TenoreLyrics = \lyricmode {
  De pro -- fun -- dis cla --
  ma -- vi, cla -- ma -- vi
  ad te, Do -- mi --
  ne: Do -- mi -- ne, ex --
  au -- di vo -- cem me --
  am.
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Larghetto" \autoBeamOff
    r2 r4 a8^\solo a
    d4 f8 d g4 b8 g
    c c f, f c4. c8
    f4 r b,8.^\tutti b16 b8 b
    g' g e c g2
    c4 r r2
  }
}

BassoLyrics = \lyricmode {
  De pro --
  fun -- dis cla -- ma -- vi, cla --
  ma -- vi ad te, Do -- mi --
  ne: Do -- mi -- ne, ex --
  au -- di vo -- cem me --
  am.
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Larghetto"
    d8-\solo d' f, d a'4 a,
    d f8 d g4 b8 g
    c4 f, c2
    f4 f, b4.-\tutti b8
    g' g e c g2
    c c-\solo
  }
}

BassFigures = \figuremode {
  r2 <5 4>8 <\t _+>4.
  <9>8 <8> <6>4 <9>8 <8>4.
  r2 <4>4 <3>
  r1
  <_!>2 <4>4 <_!>
  r2 <5>4. <6>8
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
