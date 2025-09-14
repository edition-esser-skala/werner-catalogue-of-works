\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Largo"
    R1*2
    r4 r8 d'4-\solo cis8 a c
    h e, r e'4 dis8 h fis'
    h a g fis e2
    fis4 r r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Largo"
    R1*2
    r8 d-\solo f a e4 c'!
    r8 e, g! h fis4 dis'?
    h8. h16 cis8 d4 \hA cis16 h \hA cis4
    d r r2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1*4
    r2 a'4.^\solo a8
    a4 fis8 a h4 h
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus
  De -- i, qui tol -- lis
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    g'4.^\solo h8 a e4 g8
    fis d r fis g a h4
    a r r2
    R1*2
    d,4. d8 d4 h8 d
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di:

  A -- gnus De -- i, qui
}

Tenore = {
  \relative c' {
    \clef tenor
    R1*6
  }
}

TenoreLyrics = \lyricmode {
  %tacet
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1
    r2 r4 r8 g'~^\solo
    g fis d f e a, r a'~
    a gis e g fis h, h' a
    g[ fis] e[ d!] a'4 a,
    d r r2
  }
}

BassoLyrics = \lyricmode {
  Mi -- %2
  se -- re -- re no -- bis, mi --
  se -- re -- re no -- bis, mi -- se --
  re -- re __ no -- _
  bis.
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Largo"
    g'8-\solo g, h g c4 cis
    d d'8 c! h a g4
    d d, a' a'
    e e, h' h'8 a
    g fis e d! a'4 a,
    d2 g
  }
}

BassFigures = \figuremode {
  r2 <6>
  r4. <\t>8 r2
  <4>8 <_+> <_!>4 <4>8 <_+> <_!>4
  <4>8 <_+> <_!>4 <4>8 <_+> q4
  <6>8 <6!> <6\\>4 <4> <_+>
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
