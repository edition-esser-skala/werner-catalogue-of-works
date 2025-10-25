\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    r2 h'8.-\tutti h16 d8 fis
    g d r4 d16( fis) fis( a) g( h) h( d)
    a( fis) fis( d) g( d) d( h) a4 r
    R1
    r16 e g h e4. d4 cis8
    d4 r16 a' fis d h' g a fis d a' fis d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    r2 g'8.-\tutti g16 a8 d
    d h r4 a16( d) d( fis) d( g) g( h)
    a( fis) fis( d) d( h) h( g) fis4 r
    R1
    r4 r16 e g h a8 a4 e8
    fis4 r16 a' fis d h' g a fis d a' fis d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    g'8.^\tutti g16 h8 d h g r4
    g8. g16 h8 g d'2
    d r8 a^\solo h c
    d g, c16[ h c8] h4 r
    h8.^\tutti h16 h8 h a2
    a8 a d d d d d d
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei --
  son. Pa -- ter de
  coe -- lis, De -- us,
  mi -- se -- re -- re no --
  bis, san -- cta Ma -- ri -- a, De -- i
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    d8.^\tutti d16 d4 r8 d a' fis
    d d r4 a'8 fis g h
    a fis d g fis4 r
    d8^\solo d16 d e8 fis g[ d] e[ fis]
    g16[ fis] g8 g8.^\tutti g16 g8 fis e4
    fis r8 fis[ g] fis r fis
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e, Chri -- ste e --
  lei -- son, Chri -- ste au -- di
  nos, ex -- au -- di nos.
  Fi -- li, Re -- dem -- ptor mun -- di,
  De -- us, mi -- se -- re -- re no --
  bis, o -- ra pro
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    h8.^\tutti h16 h4 r8 h d a
    h h r4 d8 a h d
    d a h8. h16 a4 r
    r2 h8^\solo h16 h cis8 d
    e h e8.^\tutti e16 e8 d d[ cis]
    d4 r8 a[ h] a r a
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e, Chri -- ste e --
  lei -- son, Chri -- ste au -- di
  nos, ex -- au -- di nos.
  Spi -- ri -- tus San -- cte,
  De -- us, mi -- se -- re -- re no --
  bis, o -- ra pro
}


Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    g'8.^\tutti g,16 g4 r8 g' fis d
    h g r4 fis'8 d' h g
    fis d h g d'4 r
    h'8^\solo h a8. a16 g8 g4 fis8
    e e e^\tutti d cis d a4
    d r8 d[ g] d r d
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e, Chri -- ste e --
  lei -- son, Chri -- ste au -- di
  nos, ex -- au -- di nos.
  San -- cta Tri -- ni -- tas, u -- nus
  De -- us, mi -- se -- re -- re no --
  bis, o -- ra pro
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    g'8.-\tutti g,16 g4 r8 g' fis d
    h g r4 fis'8 d' h g
    fis d h g d' d'4-\solo c8
    h4 a g4. fis8
    e4.-\tutti d8 cis d a4
    d r8 d g d r d
  }
}

BassFigures = \figuremode {
  r1
  r
  r2 r8 <3> <4 2> <6>
  q4 <5>8 <6> <3>4 <4\+ 2>8 <6>
  r2 <5>4 <4>8 <_+>
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
